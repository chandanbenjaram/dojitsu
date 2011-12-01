Rails.application.config.middleware.use OmniAuth::Builder do  
  provider :facebook, '232592880122189', '7d7557a9be33907cffda2aa02173a03c', :client_options => { :ssl => { :ca_file => "#{Rails.root}/config/ca-bundle.crt" } }   
end
