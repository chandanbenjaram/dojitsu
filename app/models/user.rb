class User < ActiveRecord::Base
  regex_email= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :user_connections
  has_many :authentications

  has_many :subscriptions

  attr_accessible :fname, :lname, :email, :password, :password_confirmation, :remember_me

  validates :email, :presence => true, :format => {:with => regex_email}, :uniqueness => {:case_sensitive => false}

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session[:omniauth]
        user.authentications.build(:provider => data['provider'], :uid => data['uid'])
      end
    end
  end

  def apply_omniauth(omniauth)      
    authentications.build(:provider => omniauth[:provider], :uid => omniauth[:uid], :email => omniauth[:email], :name => omniauth[:name], :first_name => omniauth[:first_name], :last_name => omniauth[:last_name], :image_path => omniauth[:image_path], :location_name => omniauth[:location_name], :location_id => omniauth[:location_id], :token =>omniauth[:token])
  end

  def password_required?
    #      debugger
    (authentications.empty? || !password.blank?) && super
  end

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token['extra']['user_hash']
    if user = User.find_by_email(data["email"])
      user
    else # Create a user with a stub password.
      User.create!(:email => data["email"], :password => Devise.friendly_token[0,20])
    end
  end

  def challenges 
    #debugger
    #Challenge.where({:user_id=>self.id}).all
    Challenge.all
  end
  
  def facebook
    FbGraph::User.new('me', :access_token => self.authentications.find_by_provider('facebook').token).fetch
    #self.authentications.find_by_provider('facebook')
  end 
end