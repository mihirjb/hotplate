require "spec_helper"

describe MumscrapurlsController do
  describe "routing" do

    it "routes to #index" do
      get("/mumscrapurls").should route_to("mumscrapurls#index")
    end

    it "routes to #new" do
      get("/mumscrapurls/new").should route_to("mumscrapurls#new")
    end

    it "routes to #show" do
      get("/mumscrapurls/1").should route_to("mumscrapurls#show", :id => "1")
    end

    it "routes to #edit" do
      get("/mumscrapurls/1/edit").should route_to("mumscrapurls#edit", :id => "1")
    end

    it "routes to #create" do
      post("/mumscrapurls").should route_to("mumscrapurls#create")
    end

    it "routes to #update" do
      put("/mumscrapurls/1").should route_to("mumscrapurls#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/mumscrapurls/1").should route_to("mumscrapurls#destroy", :id => "1")
    end

  end
end
