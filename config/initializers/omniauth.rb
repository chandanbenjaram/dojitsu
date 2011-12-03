Rails.application.config.middleware.use OmniAuth::Builder do  
  provider :facebook, Rails.application.config.fb_app_id, Rails.application.config.fb_app_secret, {:scope =>Rails.application.config.fb_scopes, :client_options => { :ssl => { :ca_file => "#{Rails.root}/config/ca-bundle.crt" } }}
end