Rails.application.config.middleware.use OmniAuth::Builder do  
<<<<<<< HEAD
  provider :facebook, '232592880122189', '7d7557a9be33907cffda2aa02173a03c', :client_options => { :ssl => { :ca_file => "#{Rails.root}/config/ca-bundle.crt" } }   
=======
  provider :facebook, '181761375220642', '28dc6fdf9d4318d0a3ae0c91692b4005', {:scope => 'offline_access, email, read_friendlists, manage_notifications, read_mailbox', :client_options => { :ssl => { :ca_file => "#{Rails.root}/config/ca-bundle.crt" } }}
>>>>>>> e22c8aaf355ad54d79e8c8eae79fd5ea6a3c08ec
end
