class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :first_name, type: String
  field :last_name, type: String
  field :email,              :type => String, :default => ""
  field :encrypted_password, :type => String, :default => ""
  field :reset_password_token,   :type => String
  field :remember_token, type: String
  field :remember_created_at, :type => Time
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String
  field :salt,:type => String
  field :confirmation_token,   :type => String
  field :confirmed_at,         :type => Time
  field :confirmation_sent_at, :type => Time

  regex_email= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :confirmable

  has_many :user_connections
  has_many :authentications, autosave: true, dependent: :destroy

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
    Message.all(conditions: { :to => (fbauth.uid rescue gmauth.try(:id)), :isDeleted => 0 }, limit: 6).desc("created_at")
    #Message.all(conditions: { :to => (fbauth.uid rescue gmauth.id)}, limit: 6).desc("created_at")
  end

  def unReadMessage
    Message.all(conditions: { :to => fbauth.uid , :isRead => 0 })
  end

  def challenges
    challenges = []
    #logger.debug gmauth.id
    mail_auth_id = gmauth.try(:id).try(:to_s)
    Challenge.any_of({:user_id => (fbauth.uid rescue mail_auth_id) }, {"child_challenges.user_id" => (fbauth.uid rescue mail_auth_id)}).each do |aChallenge|
      addUserOnlyChallenge challenges, aChallenge
    end

    return challenges
  end

  def facebook
    FbGraph::User.new('me', :access_token => self.fbauth.try(:token)).fetch
  end

  def fbauth
    self.authentications.where(:provider=>'facebook').first
  end

  def gmauth
    User.where(:email=>email).first
    #logger.debug "Maisa"
  end

  private
  def addUserOnlyChallenge(challenges, aChallenge)
    if aChallenge.user_id == (fbauth.uid rescue gmauth.try(:id).try(to_s))
      challenges.push(aChallenge)
    end

    aChallenge.child_challenges.each do |aChallengeChild|
      addUserOnlyChallenge challenges, aChallengeChild
    end
  end
end