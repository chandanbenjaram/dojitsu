class StaticController < ApplicationController
  def home  
    render 'static/welcome'
  end 
  
  def aboutus
    @title = "About Us"
    render 'static/aboutus'
  end
  
  def contactus
    @title = "Contact Us"
    render 'static/contactus'
  end
  
  def login            
    @title = "User Login/Registration"
    render 'static/login'
  end
end
