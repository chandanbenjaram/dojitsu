require "spec_helper"

describe ValidatiionsController do
  describe "routing" do

    it "routes to #index" do
      get("/validatiions").should route_to("validatiions#index")
    end

    it "routes to #new" do
      get("/validatiions/new").should route_to("validatiions#new")
    end

    it "routes to #show" do
      get("/validatiions/1").should route_to("validatiions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/validatiions/1/edit").should route_to("validatiions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/validatiions").should route_to("validatiions#create")
    end

    it "routes to #update" do
      put("/validatiions/1").should route_to("validatiions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/validatiions/1").should route_to("validatiions#destroy", :id => "1")
    end

  end
end
