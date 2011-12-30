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
        @attr = { :name =>"", :email =>"", :password =>"",
                  :password_conirmation =>"" }
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
        response.should render_template("new")
      end
    end
  end

  describe "delete 'destroy'" do
    it "should be successful" do
      delete :destroy
      response.should be_success
    end
  end

end
