require 'spec_helper'

describe UserConnectionsController do
   
 include Devise::TestHelpers
 
 def mock_user(stubs={})
    @mock_user ||= mock_model(User, stubs).as_null_object
 end

  before(:each) do
      # mock up an authentication in the underlying warden library
      request.env['warden'] = mock(Warden, :authenticate => mock_user,
                                           :authenticate! => mock_user)
  end
	
	  describe "GET 'index'" do
      it "should be successful" do
        get :index
        response.should be_success
      end
      
      it "should have the right title" do
        get :index
     
      end
    end
	
	describe "GET 'delete_contact'" do
      it "should be successful" do
        get :delete_contact
        response.should be_success
      end
      
      it "should have the right title" do
        get :delete_contact
     
      end
    end
	
	describe "GET 'myDojo'" do
      it "should be successful" do
        get :myDojo
        response.should be_success
      end
      
      it "should have the right title" do
        get :myDojo
     
      end
    end
	
	describe "GET 'people'" do
      it "should be successful" do
        get :people
        response.should be_success
      end
      
      it "should have the right title" do
        get :people
     
      end
    end
	
	
end
