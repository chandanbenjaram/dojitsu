require 'spec_helper'

describe AuthenticationsController do
  render_views

  before do 
     request.env["devise.mapping"] = Devise.mappings[:user] 
  end
  
  describe "GET 'index'" do
    it "should be successful" do
      get :index
      response.should be_success
    end
  end

  describe "POST 'create'" do
    describe "failure" do 
      before(:each) do
        @attr = { :first_name =>"", :last_name =>"", :email =>"", :password =>"",
                  :password_confirmation =>"" }
      end
      
      before do 
        post :create
      end
      
      it "should not create a user" do
        lambda do
          post :create, :user => @attr
        end.should_not change(User, :count)
      end
      
      it "should have the right title" do
        post :create, :user => @attr
        response.should have_selector("title", :content => "Dojitsu") 
      end
      
      it "should be successful" do
        post :create
        response.should be_success
      end
      
      it "should render the 'new' page" do
        get :new, :user => @attr
        response.should redirect_to(new_user_registration_path)
      end
    end
    
    describe "success" do
      before (:each) do
        @attr_s = { :first_name =>"Maisa", :last_name =>"Pride", :email =>"maisa@solutions.com", :password =>"admin",
                  :password_confirmation =>"admin", :encrypted_password => "$2a$10$nr3xiC9amAw.WqAqf5naxOZ.F8r8YDwRJK1NsOY8pucgKFzaZxUP6" }
        @email = "maisa@solutions.com"        
      end
      
      it "should create a user" do
        lambda do
          post :create, :user => @attr_s
        end.should change(User, :count).by(1)
      end
      
      it "should redirect to the signin user page" do
        post :create, :user => @attr_s
        response.should redirect_to(sign_in_and_redirect(:user, @email))
      end
    end
    
  end

  #describe "delete 'destroy'" do
  #  it "should be successful" do
  #    delete :destroy
  #    response.should be_success
  #  end
  #end

end
