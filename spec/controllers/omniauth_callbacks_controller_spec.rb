require 'spec_helper'

describe OmniauthCallbacksController do
    
 include Devise::TestHelpers
 
 def mock_user(stubs={})
    @mock_user ||= mock_model(User, stubs).as_null_object
 end
 

  before(:each) do
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
  end

  it "should display facebook logged in status" do
    @user = User.create(:id => "100000018823471", :token => "AAACEdEose0cBAEIWkEPnmt8uAYnntM7kpEJwpfxlE5PpBe7ziOzjlZBxZC52ZBMyqz5MyG4qwIbi5S5EuWyuKsKj3Pioq7XDUhNiMsfAghCZAQgtQdEf")
    sign_in @user

  end


  

	
end 
