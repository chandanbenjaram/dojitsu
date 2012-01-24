require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require *Rails.groups(:assets => %w(development test))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module Dojitsu
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Custom directories with classes and modules you want to be autoloadable.
    # config.autoload_paths += %W(#{config.root}/extras)

    # Only load the plugins named here, in the order given (default is alphabetical).
    # :all can be used as a placeholder for all plugins not explicitly named.
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

    # Activate observers that should always be running.
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"
    config.action_mailer.default_url_options = { :host => 'localhost:4000' }

    # mail server settings
      
    config.action_mailer.delivery_method = :smtp

    config.action_mailer.smtp_settings = {
      :enable_starttls_auto => true,
      :address => "smtp.gmail.com",
      :port => 587,
      :domain => "gmail.com",
      :authentication => :login,
      :user_name => 'dojitsu.whitebelt@gmail.com',
      :password => 'whitebelt',
    }

    config.action_mailer.perform_deliveries = true
    config.action_mailer.raise_delivery_errors = true 
    
    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    # Enable the asset pipeline
    config.assets.enabled = true
    config.autoload_paths << "#{config.root}/lib"
    config.generators do |g| 
      g.orm :active_record 
    end
    
    # FACEBOOK GLOBALS
    config.fb_scopes = 'offline_access, email, read_friendlists,user_birthday,manage_notifications, read_mailbox' 
    # fallback used for development, test. prod differs
	
    config.fb_app_id = '181761375220642' 
    config.fb_app_secret = '28dc6fdf9d4318d0a3ae0c91692b4005'  
  end
end
