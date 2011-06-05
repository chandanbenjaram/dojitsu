# == Schema Information
# Schema version: 20110515043950
#
# Table name: users
#
#  id       :integer(4)      not null, primary key
#  fname    :string(255)     not null
#  lname    :string(255)     not null
#  emailid  :string(255)     not null
#  password :string(255)     not null
#
require 'digest'

class User < ActiveRecord::Base
  has_many :subscriptions
  has_many :challenges, :through => :subscriptions

  attr_accessor :password
  attr_accessible :fname, :lname, :emailid, :password, :password_confirmation

  regex_emailid = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :fname, :presence => true  
  validates :lname, :presence => true
  validates :emailid, :presence => true, :format => {:with => regex_emailid}, :uniqueness => {:case_sensitive => false}

  # automatically create the virtual attribute 'password_confirmation'.
  validates :password, :presence => true, :confirmation => true, :length => { :within => 6..50 }

  before_save :encrypt_password                                                                                                                            

  def has_password?(password_input)
    # match against encrypted password
    self.encrypted_password == encrypt(password_input)
  end

  class << self
    def authenticate(emailid, password)
      user = find_by_emailid(emailid)
      return nil if user.nil?
      return user if user.has_password?(password) 
    end        
  end

  private  
  def encrypt_password                              
    self.salt =  make_salt if new_record?
    self.encrypted_password = encrypt(password)
  end

  def make_salt
    secure_hash("#{Time.now.utc}--#{password}")
  end 

  def encrypt(input)
    secure_hash("#{salt}--#{input}")
  end     

  def secure_hash(input)
    Digest::SHA2.hexdigest(input)
  end

end
