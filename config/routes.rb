Dojitsu::Application.routes.draw do   
  get "dashboard/index"

  # user registration & 3rd party logins
  match 'users/auth/:provider/callback', :to=>'authentications#create'
  devise_for :users, :controllers => { :registrations => "registrations"}
  resources :authentications

  resources :challenges do
    collection do
      get "show_soc"
      get "task_update"
      get "show_per"
      get "my_challenge"
      get "invitee_accepted_req"
      get "challenge_comp"
      get "task_update_c"
      get "date_update"
      get "message"
      get "add_task_link"
      get "add_task_fun"
      get "update_status"
      get "update_status_af_meg"
      put "update_task_soc"
      put :update_attribute_on_the_spot
    end
  end

  # static pages
  match '/aboutus', :to=>'static#aboutus'
  match '/contactus', :to=>'static#contactus'
  resources :user_connections   do
    collection do
      put :update_attribute_on_the_spot
    end
  end
  resources :messages do
    collection do
      get "storemessage"
    end	
  end 


  # root page
  root :to=>'static#home'
end
