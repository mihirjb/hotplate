require "spec_helper"

describe PunescrapurlsController do
  describe "routing" do

    it "routes to #index" do
      get("/punescrapurls").should route_to("punescrapurls#index")
    end

    it "routes to #new" do
      get("/punescrapurls/new").should route_to("punescrapurls#new")
    end

    it "routes to #show" do
      get("/punescrapurls/1").should route_to("punescrapurls#show", :id => "1")
    end

    it "routes to #edit" do
      get("/punescrapurls/1/edit").should route_to("punescrapurls#edit", :id => "1")
    end

    it "routes to #create" do
      post("/punescrapurls").should route_to("punescrapurls#create")
    end

    it "routes to #update" do
      put("/punescrapurls/1").should route_to("punescrapurls#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/punescrapurls/1").should route_to("punescrapurls#destroy", :id => "1")
    end

  end
end
