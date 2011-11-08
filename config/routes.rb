Dojitsu::Application.routes.draw do   
  get "dashboard/index"

  # user registration & 3rd party logins
  match 'users/auth/:provider/callback', :to=>'authentications#create'
  devise_for :users, :controllers => { :registrations => "registrations"}

  # static pages
  match '/aboutus', :to=>'static#aboutus'
  match '/contactus', :to=>'static#contactus'
  match '/aboutus', :to=>'static#aboutus'  
  
  resources :authentications
  resources :usermails
 
  resources :challenges do
    collection do
      get "show_soc"
      get "show_per"
      get "my_challenge"
      get "invite_frd"
	  put :update_attribute_on_the_spot
    end
  end

  resources :user_connections
  resources :messages
  resources :usermail

  # root page
  root :to=>'static#home'
end
