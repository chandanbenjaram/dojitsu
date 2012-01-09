require "spec_helper"

describe UsermailsController do
  describe "routing" do

    it "routes GET /challenge to challenges, index" do
      { :get => "/challenges"}.should route_to(:controller => 'challenges', :action => 'index')
    end
    

  end
end
