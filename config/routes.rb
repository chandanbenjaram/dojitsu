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
      get "add_task"
      get "update_task"
      get "test"      
    end
  end
  resources :user_connections
  resources :messages
  resources :usermail

  resources :user do

  end


  # root page
  root :to=>'static#home'
end
