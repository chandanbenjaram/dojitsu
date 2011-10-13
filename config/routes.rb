Dojitsu::Application.routes.draw do   
  resources :usermails

  # user registration & 3rd party logins
  match 'users/auth/:provider/callback', :to=>'authentications#create'
  devise_for :users, :controllers => { :registrations => "registrations"}

  # static pages
  match '/aboutus', :to=>'static#aboutus'
  match '/contactus', :to=>'static#contactus'
  resources :authentications
  resources :challenges
  resources :user_connections
  resources :usermail

  # root page
  root :to=>'static#home'
end
