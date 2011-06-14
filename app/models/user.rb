class User < ActiveRecord::Base
  regex_email= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable
         
  has_many :authentications
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
    authentications.build(:provider => omniauth[:provider], :uid => omniauth[:uid], :email => omniauth[:email], :name => omniauth[:name])
  end

  def password_required?
    #      debugger
    (authentications.empty? || !password.blank?) && super
  end
end
