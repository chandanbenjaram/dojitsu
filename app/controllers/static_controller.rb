class StaticController < ApplicationController
  def welcome_page
    render 'static/welcome'
  end 
  
  def auth_page            
    render 'static/login'
  end
end
