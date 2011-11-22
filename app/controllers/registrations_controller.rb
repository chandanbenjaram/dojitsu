class RegistrationsController < Devise::RegistrationsController
  # def create
  #   super
  #   session[:omniauth] = nil unless @user.new_record?
  # end
  # 
  # protected
  # 
  # def build_resource(*args)
  #   # debugger
  #   super
  #   if session[:omniauth]
  #     @user.apply_auth(session[:omniauth])
  #     @user.valid?
  #   end
  # end 
 # me = FbGraph::User.me(ACCESS_TOKEN)
 #render :text => me.friend_lists
 def new
 end
end