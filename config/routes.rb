Dojitsu::Application.routes.draw do   
  get "dashboard/index"

  # user registration & 3rd party logins
  match 'users/auth/:provider/callback', :to=>'authentications#create'
  devise_for :users, :controllers => { :registrations => "registrations"}

  # static pages
  match '/aboutus', :to=>'static#aboutus'
  match '/contactus', :to=>'static#contactus'
  resources :authentications
  resources :usermails
  
  resources :challenges do
    collection do
      get "add_task"
    end
  end
  resources :user_connections
  resources :usermail

  # root page
  root :to=>'static#home'
end