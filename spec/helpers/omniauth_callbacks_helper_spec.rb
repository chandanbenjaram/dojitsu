require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the OmniauthCallbacksHelper. For example:
#
# describe OmniauthCallbacksHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end


describe OmniauthCallbacksHelper do
 OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(:facebook, {
    :provider => 'facebook',
    :uid => '100000018823471',
    :user_info => {
        :name => 'Sriram Ilapakurty'
      }
})

end

#OmniAuth.config.test_mode = true
#OmniAuth.config.add_mock(:facebook, {  :provider    => "facebook", 
     #                             :uid         => "100000018823471", 
          #                        :user_info   => {   :name       => "Sriram Ilapakurty"},
           #                       :credentials => {   :access_token => "AAACEdEose0cBAEIWkEPnmt8uAYnntM7kpEJwpfxlE5PpBe7ziOzjlZBxZC52ZBMyqz5MyG4qwIbi5S5EuWyuKsKj3Pioq7XDUhNiMsfAghCZAQgtQdEf"} })

#end


