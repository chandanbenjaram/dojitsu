class UserConnectionsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user_connections = Challenge.all;
  end
<<<<<<< HEAD


=======
  
  def dashbord
    
  end
>>>>>>> 2d381d6afdaea9ef79a35d8d34ab1030e0b761ba
end
