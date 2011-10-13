class UserConnectionsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user_connections = Challenge.all;

  end
def profile
  profile ||= FbGraph::User.me(self.authentications.find_by_provider('facebook').token).fetch
end

  def dashbord
  end
end
