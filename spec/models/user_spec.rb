require 'spec_helper'

describe User do
  before(:each) do
    @attr = { :fname => "john", :lname => "doe", :emailid => "user@example.com", :password => "testpassword" }
  end

  it "should create a new user" do
    User.create!(@attr)
  end

  it "should require a fname" do
    user = User.new(@attr.merge(:fname => ""))
    user.should_not be_valid
  end   

  it "should require a lname" do
    user = User.new(@attr.merge(:lname => ""))
    user.should_not be_valid
  end

  it "should require a emailid" do
    user = User.new(@attr.merge(:emailid => ""))
    user.should_not be_valid
  end       

  it "should accept valid emailid" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      user = User.new(@attr.merge(:emailid => address))
      user.should be_valid
    end
  end

  it "should reject invalid emailid" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      user = User.new(@attr.merge(:emailid => address))
      user.should_not be_valid
    end
  end      
  
  it "should validate duplicate email addresses" do
    user = User.create!(@attr)
    user = User.new(@attr)
    user.should_not be_valid
  end 
  
  it "should validate duplicate email addresses (CASE SENSITIVE)" do   
    emailid_upper = @attr[:emailid].upcase
    User.create!(@attr.merge(:emailid => emailid_upper))
    user = User.new(@attr)
    user.should_not be_valid
  end   

  it "should require a password" do
    user = User.new(@attr.merge(:password => ""))
    user.should_not be_valid
  end  
end
