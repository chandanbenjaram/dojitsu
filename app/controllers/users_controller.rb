class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @title = @user.fname + " " +  @user.lname
  end

  def new
    @title = "Sign Up"
  end                             

  def index
  end
end
