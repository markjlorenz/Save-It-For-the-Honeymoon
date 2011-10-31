require "spec_helper"

describe MerchantsController do
  describe "routing" do

    it "routes to #index" do
      get("/merchants").should route_to("merchants#index")
    end

    it "routes to #new" do
      get("/merchants/new").should route_to("merchants#new")
    end

    it "routes to #show" do
      get("/merchants/1").should route_to("merchants#show", :id => "1")
    end

    it "routes to #edit" do
      get("/merchants/1/edit").should route_to("merchants#edit", :id => "1")
    end

    it "routes to #create" do
      post("/merchants").should route_to("merchants#create")
    end

    it "routes to #update" do
      put("/merchants/1").should route_to("merchants#update", :id => "1")
    end

  end
end
