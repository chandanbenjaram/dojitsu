class UserConnectionsController < ApplicationController
  before_filter :authenticate_user!


  def index
    @user_connections = Challenge.all;
	#raise current_user.facebook.uid.inspect
    #@user_connections = FbGraph::User.me(AAAAAAITEghMBAGwEqIvywCnasJzScTAZAIKgx1mzI0SE8wWbEe78FmLF2DsrZBwnZBqQZB5hubkGq8ZAT9zYEJDeEMsYlQiZBSujBZBip28ZCNrxtAQ7JJPp)
    #friendslist = @user_connections.friends
  end


  def new
    @user_connection = UserConnection.new
     render :action => "new"
  end


  def create
    @user_connection = UserConnection.new(params[:user_connection])

      if @user_connection.save
       redirect_to(@user_connection, :notice => 'user was successfully created.')
      else
    render :action => "invite_contact"
      end
	  end

  def profile
    prsofile ||= FbGraph::User.me(self.authentications.find_by_provider('facebook').token).fetch
  end

  def sendInvitation
	if !params[:inviteIds].nil?
		params[:inviteIds].each do |inviteId|
			current_user.user_connections.find_or_create_by(:target_id => inviteId )
		end
	end
  end

  def dashbord
  end

 def delete_contact
  @useconnection = params[:id]
	render :layout => false

	end

 def invite_contact
      	render :layout => false
	end

	def connections_selection
  end

  def myDojo
	render :layout => false
  end

  def people
	render :layout => false
  end


  def destroy
    @useconnection = UserConnection.where(:target_id => params[:id]).first
    @useconnection.destroy
	redirect_to :action => 'index'
  end




end
