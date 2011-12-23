class AuthenticationsController < ApplicationController
  require 'fb_graph'

  def index
  end

  def create
    # get provider
    params[:provider] ? provider_route = params[:provider] : provider_route = ''

    # callback hash    
    omniauth = request.env["omniauth.auth"]

    if omniauth and params[:provider]
        if provider_route == 'facebook'
            # user unique id per provider [REQUIRED]
            omniauth['uid'] ?  uid =  omniauth['uid'] : uid = ''
            omniauth['provider'] ? provider =  omniauth['provider'] : provider = ''

            # user profile specific
            if infoKey = omniauth.info
              email =  infoKey.email
              name =  infoKey.name
              first_name =  infoKey.first_name
              last_name =  infoKey.last_name          
              image_path =  infoKey.image_path          
            end

            # user location specific  
            location_name = omniauth['extra']['user_hash']['location']['name'] rescue nil 
            location_id = omniauth['extra']['user_hash']['location']['id'] rescue nil


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
            @current_user.authentications.create!(:provider => provider, :uid => uid, :name => name, :email => email, :first_name => first_name, :last_name => last_name, :token => omniauth['credentials']['token'])
            flash[:notice] = "Facebook authentication successful"
            return

          else  
            user = User.find_or_initialize_by_email(:email => email)
            auth_hash = {:provider => provider, :uid => uid, :name => name, :email => email, :first_name => first_name, :last_name => last_name, :token => omniauth['credentials']['token']}
            user.apply_omniauth(auth_hash)
            user.confirm!
            if user.save!
              flash[:notice] = "New user signed in successfully." 
              sign_in_and_redirect(:user, user)
              session[:isNewChallenge] = "isNew"
			 session[:isNewChallenge] :disabled => true
            else
              redirect_to new_user_registration_path
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


  def passthru
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end
end
