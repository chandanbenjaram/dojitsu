require 'spec_helper'

describe RegistrationsController do
  render_views
  
  before do 
     request.env["devise.mapping"] = Devise.mappings[:user] 
  end 
  
  describe "GET 'new'" do
    it "should be successful" do
      get :new
      response.should be_success
      response.should render_template('new')
    end
    
    it "should have the right title" do
      get :new
      response.should have_selector("title", :content => "Dojitsu")
    end
    
  end

end
