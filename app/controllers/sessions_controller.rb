class SessionsController < ApplicationController
  def new
    @title = "Sign in"
  end

  def create                                                                         
    user = User.authenticate(params[:session][:emailid], params[:session][:password])
    if user.nil?
      # render error view
      flash.now[:error] = "Invalid email/password combination"
      @title = "Sign in"
      render 'new'
    else
      sign_in user
      redirect_to user
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
