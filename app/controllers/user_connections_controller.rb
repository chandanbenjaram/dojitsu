class UserConnectionsController < ApplicationController
  before_filter :authenticate_user!


  def index
    @user_connections = Challenge.all;
	#raise current_user.facebook.uid.inspect
    #@user_connections = FbGraph::User.me(AAAAAAITEghMBAGwEqIvywCnasJzScTAZAIKgx1mzI0SE8wWbEe78FmLF2DsrZBwnZBqQZB5hubkGq8ZAT9zYEJDeEMsYlQiZBSujBZBip28ZCNrxtAQ7JJPp)
    #friendslist = @user_connections.friends
  end

  def profile
    prsofile ||= FbGraph::User.me(self.authentications.find_by_provider('facebook').token).fetch
  end


  def dashbord
  end
  
  def connections_selection
  end
  
  def destroy
    @useconnection = UserConnection.find(params[:id])
    @useconnection.destroy
	redirect_to :action => 'index'
  end
  
end
