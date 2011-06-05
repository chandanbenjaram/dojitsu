class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @title = @user.fname + " " +  @user.lname
  end

  def new      
    @user = User.new
    @title = "Sign Up"
  end                             

  def create                    
    @user = User.new(params[:user])
    if @user.save                           
      flash[:success] = "Welcome to Dojitsu"
      redirect_to @user
    else            
      @title = "Sign up"      
      render :new
    end
  end
  
  def index
  end
end
