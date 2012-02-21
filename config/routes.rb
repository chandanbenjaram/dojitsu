Dojitsu::Application.routes.draw do   
  get "dashboard/index"
  get "dashboard/whatsNew"
  get "dashboard/message"
  get "dashboard/myChallenge"
  get "dashboard/dashboardIndex"
  get "dashboard/against_others"
  get "dashboard/against_myself"
  # user registration & 3rd party logins
  match 'users/auth/:provider/callback', :to=>'authentications#create'

  devise_for :users, :controllers => { :registrations => "registrations"}
  resources :authentications

  resources :challenges do
    collection do
    	post "storeWinner"
      get "show_soc"
      get "task_update"
      get "show_per"
      get "my_challenge"
      get "invitee_accepted_req"
      get "challenge_comp"
      get "task_update_c"
      get "date_updateEnd"
      get "date_updateStart"
      get "message"
      get "add_task_link"
      get "add_task_fun"
      get "update_status"
      get "socialPeople"
      get "nonLoginShowPersonal"
      get "nonLoginShowSocial"
      get "nonLoginIndex"
      get "paginationTest"
      get "update_status_af_meg"
      put "update_task_soc"
      get "scoreboard_main"
      get "filter"
      get "trophies"
      get "scoreboard"
      get "publish"
      get "title_update"
      get "task_update"
      get "desc_update"
      get "title_soc_update"
      get "desc_soc_update"
	  get "update_tasks_list"
	  put "update_tasks_list"
	  get "myscore_update_self_report"
      put :update_attribute_on_the_spot 
      get :get_attribute_on_the_spot
	  get "score_soc_update"
      get "search_people"
	  get "change_challenge_status"
	  get "update_status_again"
	  get "mForWinner"
	  get "registerToMessage"
	  get "deleteWinner"	
	  get "winnerListPopup"
	  get "whoAccepted"
	  get "whoThinking"
	  get "whoDeclined"	
	  get "myAccepted"
	  get "myDeclined"
	  get "myThinking"
    end
  end

  # static pages
  match '/aboutus', :to=>'static#aboutus'
  match '/contactus', :to=>'static#contactus'
  resources :user_connections do
    collection do
      get "sendInvitation"
      get "myDojo"
      get "people"
      get "invite_contact"
      get "delete_contact"
    end
  end

  resources :messages do
    collection do
      post "storemessage"
      get "message"
      get "newmessage"
      get "individualAllMessage"
      get "markUnread"      		
    end	
  end 


  # root page
  root :to=>'static#home'
end
