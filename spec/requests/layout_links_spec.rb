require 'spec_helper'

describe "LayoutLinks" do
  it "Should be successful" do
    get '/'
    response.should have_selector("title", :content => "Dojitsu")
  end

  it "Should be successful" do
    get '/login'
    response.should have_selector("title", :content => "User Login/Registration")
  end

  it "Should be successful" do
    get '/aboutus'
    response.should have_selector("title", :content => "About Us")
  end

  it "Should be successful" do
    get '/contactus'
    response.should have_selector("title", :content => "Contact Us")
  end
  
  it "Should be successful" do
    get '/signup'
    response.should have_selector("title", :content => "Sign Up")
  end
end
