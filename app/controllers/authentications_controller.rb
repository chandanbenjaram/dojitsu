class AuthenticationsController < ApplicationController
  require 'fb_graph'
  
  def index
  end

  def create
    # get provider
    params[:provider] ? provider_route = params[:provider] : provider_route = 'no provider (invalid callback)'

    # callback hash    
    omniauth = request.env["omniauth.auth"]

#    logger.info "From authentication call back, #{request}"
#    logger.info "From authentication call back, #{session[:omniauth]["credentials"]["token"]}"
#    session[:omniauth]["credentials"]["token"]

#    debugger
#      render :text => FbGraph::User.me(omniauth["credentials"]["token"]).fetch.friends.to_yaml
#      render :text => request.env["omniauth.auth"].to_yaml
#      return
      
    # is valid?
    if omniauth and params[:provider]
      # grab all required hash values with defaults for only facebook provider
      if provider_route == 'facebook'
        omniauth['extra']['user_hash']['email'] ? email =  omniauth['extra']['user_hash']['email'] : email = ''
        omniauth['extra']['user_hash']['name'] ? name =  omniauth['extra']['user_hash']['name'] : name = ''
        omniauth['extra']['user_hash']['id'] ?  uid =  omniauth['extra']['user_hash']['id'] : uid = ''
        omniauth['provider'] ? provider =  omniauth['provider'] : provider = ''
      else                                       
        render :text => '--- provider, #{@provider_route}, not supported ---'  
        return
      end


      
      # continue on valid uid and provider
      if uid != '' and provider != ''   
        auth = Authentication.find_by_provider_and_uid(provider, uid)        
        if !auth.nil?
          flash[:notice] = "Signed in successfully"
          sign_in_and_redirect(:user, auth.user)
        elsif @current_user
          @current_user.authentications.create(:provider => provider, :uid => uid, :uname => name, :uemail => email) 
          flash[:notice] = "Facebook authentication successful"
          return
        else
          
          user = User.find_or_initialize_by_email(:email => email)
          
          auth_hash = {:provider => provider, :uid => uid, :name => name, :email => email}
          user.apply_omniauth(auth_hash)

          if user.save
            flash[:notice] = "New user signed in successfully."
            sign_in_and_redirect(:user, user)
          else                                            
            # drop extra piece while passing through session for payload purposes
            session[:omniauth] = auth_hash    
            redirect_to new_user_registration_url
          end

          
        end  
      end
    end
  end

  def destroy
  end

  def failure
    redirect_to new_user_registration_path    
  end

end
