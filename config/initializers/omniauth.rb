Rails.application.config.middleware.use OmniAuth::Builder do  



  provider :facebook, '181761375220642', '28dc6fdf9d4318d0a3ae0c91692b4005', {:scope => 'offline_access, email, read_friendlists, manage_notifications, read_mailbox', :client_options => { :ssl => { :ca_file => "#{Rails.root}/config/ca-bundle.crt" } }}

end
