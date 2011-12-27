# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Dojitsu::Application.initialize!
Encoding.default_external = "UTF-8"