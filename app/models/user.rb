class User < ActiveRecord::Base
  regex_email= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :confirmable

  has_many :user_connections
  has_many :authentications

  has_many :subscriptions

  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :remember_me

  validates :email, :presence => true, :format => {:with => regex_email}, :uniqueness => {:case_sensitive => false}

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session[:omniauth]
        user.authentications.build(:provider => data['provider'], :uid => data['uid'])
      end
    end
  end

  def apply_omniauth(omniauth)      
    authentications.build(:provider => omniauth[:provider], :uid => omniauth[:uid], :email => omniauth[:email], :name => omniauth[:name], :first_name => omniauth[:first_name], :last_name => omniauth[:last_name], :token =>omniauth[:token])
  end

  def password_required?
    (authentications.empty? || !password.blank?) && super
  end

  def inbox 
    Message.all(conditions: { :to => fbauth.uid }, limit: 6).desc("created_at")
  end

  def challenges 
    challenges = []

    Challenge.any_of({:user_id => fbauth.uid }, {"child_challenges.user_id" => fbauth.uid}).each do |aChallenge|
      addUserOnlyChallenge challenges, aChallenge
    end

    return challenges
  end

  def facebook
    FbGraph::User.new('me', :access_token => self.fbauth.token).fetch
  end

  def fbauth
    self.authentications.find_by_provider('facebook')
  end

  private
  def addUserOnlyChallenge(challenges, aChallenge) 
    if aChallenge.user_id == fbauth.uid
      challenges.push(aChallenge)
    end             

    aChallenge.child_challenges.each do |aChallengeChild|
      addUserOnlyChallenge challenges, aChallengeChild
    end
  end
end