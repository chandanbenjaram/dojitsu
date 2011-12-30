require 'spec_helper'

describe ChallengesController do
  include Devise::TestHelpers
  render_views
  
  before :each do
    request.env["devise.mapping"] = Devise.mappings[:user]
  end
  
  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

end
