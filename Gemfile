source 'http://rubygems.org'

gem 'rails', '3.1.0.rc8'

gem 'mysql', '2.8.1'
#gem 'mysql2' 

# MongoDB specifics
gem "mongoid", "~> 2.2"    
#gem "bson", "= 1.4.1", :path => "vendor"

gem "mongo", "~> 1.5.0.rc0"
gem "bson", "~> 1.5.0.rc0"
gem "bson_ext", "~> 1.5.0.rc0"  

#gem "bcrypt-ruby"

#gem "bson_ext", "~> 1.4"


#gem "mongoid", "~> 2.2"
#gem "bson_ext", "~> 1.3"
#gem "bson", "~> 1.4.1"

           
# authentication specifics
gem 'devise', '1.5'
#gem "oa-oauth", :require => "omniauth/oauth"
gem "omniauth-facebook"

# helpers
gem 'json'
gem 'fb_graph', '2.1.12'

gem 'jquery-rails'
#gem 'prototype-rails'

gem 'sprockets'
gem "client_side_validations", "~> 3.1.0"

# Templating engine specifics
gem "slim-rails"

# UI templates
gem "simple-navigation"
gem "on_the_spot"

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end
group :development, :test do
	gem 'rspec-rails'
	gem 'annotate'
	#gem 'ruby-debug'
	#gem "mongrel"
	#gem 'ruby-debug-base19', "0.11.24"
	#gem 'ruby-debug19', "0.11.6"  
end       

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "~> 3.1.0.rc"
  gem 'coffee-rails', "~> 3.1.0.rc"
  gem 'execjs'
  gem 'uglifier'
  #gem 'therubyracer'   
end

# Deployment stuff
gem "highline", "~> 1.6.8"
gem "rubber", "1.15.0"
