class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @title = @user.fname + " " +  @user.lname
    sign_in @user
  end

  def new      
    @user = User.new
    @title = "Sign Up"
  end                             

  def create                    
    @user = User.new(params[:user])
    if @user.save                                                          
      sign_in @user
      flash[:success] = "Welcome to Dojitsu"
      redirect_to @user
    else            
      @title = "Sign up"      
      render :new
    end
  end

  def edit
    redirect_to @user
  end


  def index
  end
end
