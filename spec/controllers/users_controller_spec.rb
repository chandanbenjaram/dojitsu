require 'spec_helper'

describe UsersController do
  render_views

  describe "GET 'show'" do
    before(:each) do
      @user = Factory(:user)
    end

    it "should be successful" do
      get :show, :id => @user
      response.should be_success
    end

    it "should find right user" do
      get :show, :id => @user
      assigns(:user).should == @user
    end

    it "should have the right title" do
      get :show, :id => @user
      response.should have_selector("title", :content => (@user.fname.concat(" ").concat(@user.lname)))
    end
  end

  describe "GET 'new'" do
    it "should be successful" do
      get :new
      response.should be_success
    end

    it "should have the right title" do
      get :new
      response.should have_selector("title", :content => "Sign Up")
    end
  end   


  describe "POST create" do
    describe "failure" do
      before(:each) do
        @hash = { :fname => "John", :lname => "", :emailid => "", :password => "", :password_confirmation => "" }
      end

      it "should not create a user" do
        lambda do
          post :create, :user => @hash
        end.should_not change(User, :count)
      end
      
      it "should have the right title" do
        post :create, :user => @hash
        response.should have_selector("title", :content => "Sign up")
      end

      it "should render the 'new' page" do
        post :create, :user => @hash
        response.should render_template('new')
      end
    end
    
    describe "success" do
      before(:each) do
        @hash = { :fname => "John", :lname => "Doe", :emailid => "john.doe@test.com", :password => "johnpass", :password_confirmation => "johnpass" }
      end

      it "should create a user" do
        lambda do
          post :create, :user => @hash
        end.should change(User, :count).by(1)
      end

      it "should redirect to user page" do
        post :create, :user => @hash
        response.should redirect_to(user_path(assigns(:user)))
      end      

      it "should have welcome message" do
        post :create, :user => @hash 
        flash[:success].should =~ /welcome to dojitsu/i
      end      
    end
    
  end
end
