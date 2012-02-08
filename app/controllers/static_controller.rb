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
end
