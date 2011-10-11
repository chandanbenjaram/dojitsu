source 'http://rubygems.org'

gem 'rails', '3.1.0.rc8'
gem 'mysql', '2.8.1'   
         
# authentication specifics
gem 'devise'
gem "oa-oauth", :require => "omniauth/oauth"

# helpers
gem 'haml'
gem 'json'
gem 'fb_graph'
gem 'jquery-rails'
gem "client_side_validations", "~> 3.1.0"

# MongoDB specifics
gem "mongoid", "~> 2.2"
gem "bson_ext", "~> 1.3"

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end
group :development, :test do
	gem 'rspec-rails'
	gem 'annotate'
	gem 'ruby-debug'
end       

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0.rc"
  gem 'coffee-rails', "~> 3.1.0.rc"
  gem 'uglifier'
end

gem 'jquery-rails'