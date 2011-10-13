require "spec_helper"

describe UsermailsController do
  describe "routing" do

    it "routes to #index" do
      get("/usermails").should route_to("usermails#index")
    end

    it "routes to #new" do
      get("/usermails/new").should route_to("usermails#new")
    end

    it "routes to #show" do
      get("/usermails/1").should route_to("usermails#show", :id => "1")
    end

    it "routes to #edit" do
      get("/usermails/1/edit").should route_to("usermails#edit", :id => "1")
    end

    it "routes to #create" do
      post("/usermails").should route_to("usermails#create")
    end

    it "routes to #update" do
      put("/usermails/1").should route_to("usermails#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/usermails/1").should route_to("usermails#destroy", :id => "1")
    end

  end
end
