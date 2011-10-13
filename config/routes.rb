Dojitsu::Application.routes.draw do   
<<<<<<< HEAD
  resources :usermails
=======
  get "dashboard/index"
>>>>>>> 2d381d6afdaea9ef79a35d8d34ab1030e0b761ba

  # user registration & 3rd party logins
  match 'users/auth/:provider/callback', :to=>'authentications#create'
  devise_for :users, :controllers => { :registrations => "registrations"}

  # static pages
  match '/aboutus', :to=>'static#aboutus'
  match '/contactus', :to=>'static#contactus'
  resources :authentications
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
