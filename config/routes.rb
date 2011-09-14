Dojitsu::Application.routes.draw do   
  # app resources
  match 'users/auth/:provider/callback', :to=>'authentications#create'
  devise_for :users, :controllers => { :registrations => "registrations"}

  # static pages
  match '/aboutus', :to=>'static#aboutus'
  match '/contactus', :to=>'static#contactus'
  resources :authentications
  resources :challenges
  resources :user_connections

  root :to=>'static#home'
end
