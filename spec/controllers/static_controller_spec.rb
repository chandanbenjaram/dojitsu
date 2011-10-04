require 'spec_helper'

describe StaticController do
  render_views

  describe "GET 'home'" do
    it "Should be successful" do
      get 'home'           
      response.should be_success
    end

    it "Should have right title" do
      get 'home'
      response.should have_selector("title", :content => "Dojitsu")
    end
  end

  describe "GET 'aboutus'" do
    it "Should be successful" do
      get 'aboutus'
      response.should be_success
    end                                                   

    it "Should have right title" do
      get 'aboutus'
      response.should have_selector("title", :content => "About Us")
    end
  end 

  describe "GET 'contactus'"   do
    it "Should be successful" do
      get 'contactus'
      response.should be_success
    end

    it "Should have right title" do
      get 'contactus'
      response.should have_selector("title", :content => "Contact Us")
    end
  end

  describe "GET 'login'" do
    it "Should be successful" do
      get 'login'
      response.should be_success
    end

    it "Should have right title" do
      get 'login'
      response.should have_selector("title", :content => "User Login/Registration")
    end
  end   
end
