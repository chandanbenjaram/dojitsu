class UserConnectionsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user_connections = Challenge.all;
  end


end
