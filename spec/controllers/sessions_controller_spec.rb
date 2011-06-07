require 'spec_helper'

describe SessionsController do
  render_views
  describe "GET 'new'" do
    it "should be successful" do
      get :new
      response.should be_success
    end

    it "should be right title" do
      get :new
      response.should have_selector('title', :content => "Sign in")
    end    
  end      

  describe "POST 'create'" do
    describe "Invalid 'Signin'" do
      before(:each) do
        @hash = {:emailid => "sessiontest@test.com", :password => "sessionpass"}
      end

      it 'should return same page' do
        post :create, :session => @hash
        response.should render_template('new')
      end

      it 'should be right title' do
        post :create, :session => @hash
        response.should have_selector('title', :content => "Sign in")
      end

      it 'should have a flash.now message' do
        post :create, :session => @hash
        flash.now[:error].should =~ /invalid/i
      end
    end   

    describe "with valid email and password" do
      before(:each) do
        @user = Factory(:user)
        @hash = { :emailid => @user.emailid, :password => @user.password }
      end

      it "should sign-in the user" do
        post :create, :session => @hash
        controller.current_user.should == @user
        controller.signed_in?.should be_true
      end

      it "should redirect to the user show page" do
        post :create, :session => @hash
        response.should redirect_to(user_path(@user))
      end

      it "should keep user signed-in" do                               
        post :create, :session => @hash
        controller.should be_signed_in
      end
    end
  end

  describe "DELETE 'destroy'" do
    it "should sign-out user" do
      test_sign_in(Factory(:user))
      delete :destroy
      controller.should_not be_signed_in
      response.should redirect_to(root_path)
    end
  end  
end
