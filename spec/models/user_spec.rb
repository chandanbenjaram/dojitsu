require 'spec_helper'

describe User do
  before(:each) do
    @attr = { :fname => "john", :lname => "doe", :emailid => "user@example.com", :password => "testpass", :password_confirmation => "testpass" }
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

  describe "password validations" do
    it "should require a password" do
      user = User.new(@attr.merge(:password => ""))
      user.should_not be_valid
    end

    it "should require a password" do
      User.new(@attr.merge(:password => "", :password_confirmation => "")).
      should_not be_valid
    end

    it "should require a matching password confirmation" do
      User.new(@attr.merge(:password_confirmation => "invalid")).
      should_not be_valid
    end

    it "should reject short passwords" do
      short = "a" * 4
      hash = @attr.merge(:password => short, :password_confirmation => short)
      User.new(hash).should_not be_valid
    end

    it "should reject long passwords" do
      long = "a" * 51
      hash = @attr.merge(:password => long, :password_confirmation => long)
      User.new(hash).should_not be_valid
    end
  end

  describe "password encryption" do
    before(:each) do
      @user = User.create!(@attr)
    end

    it "should have an encrypted password attribute" do
      @user.should respond_to(:encrypted_password)
    end
    
    it "should set encrypted password attribute" do
      @user.encrypted_password.should_not be_blank
    end
    
    it "should be false for mismatch" do
      @user.has_password?("mismatch").should be_false
    end

    it "should be true for match" do
      @user.has_password?(@attr[:password]).should be_true
    end
    
    describe "User.authenticate method " do
      it "should return nil for no user match by email" do
        not_found = User.authenticate("nouser@example.com", @attr[:password])
        not_found.should be_nil
      end

      it "should return nil for user wrong password" do
        wrong_pass = User.authenticate(@attr[:emailid], "wrongpass")
        wrong_pass.should be_nil
      end

      it "should return user by email and password" do
        found_user = User.authenticate(@attr[:emailid], @attr[:password])
        found_user.should == @user
      end

      it "should be true for match" do
        @user.has_password?(@attr[:password]).should be_true
      end
    end
  end
end      

