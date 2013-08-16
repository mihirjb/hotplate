require "spec_helper"

describe BlorescrapurlsController do
  describe "routing" do

    it "routes to #index" do
      get("/blorescrapurls").should route_to("blorescrapurls#index")
    end

    it "routes to #new" do
      get("/blorescrapurls/new").should route_to("blorescrapurls#new")
    end

    it "routes to #show" do
      get("/blorescrapurls/1").should route_to("blorescrapurls#show", :id => "1")
    end

    it "routes to #edit" do
      get("/blorescrapurls/1/edit").should route_to("blorescrapurls#edit", :id => "1")
    end

    it "routes to #create" do
      post("/blorescrapurls").should route_to("blorescrapurls#create")
    end

    it "routes to #update" do
      put("/blorescrapurls/1").should route_to("blorescrapurls#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/blorescrapurls/1").should route_to("blorescrapurls#destroy", :id => "1")
    end

  end
end
