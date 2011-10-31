require "spec_helper"

describe ConsumersController do
  describe "routing" do

    it "routes to #index" do
      get("/consumers").should route_to("consumers#index")
    end

    it "routes to #new" do
      get("/consumers/new").should route_to("consumers#new")
    end

    it "routes to #show" do
      get("/consumers/1").should route_to("consumers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/consumers/1/edit").should route_to("consumers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/consumers").should route_to("consumers#create")
    end

    it "routes to #update" do
      put("/consumers/1").should route_to("consumers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/consumers/1").should route_to("consumers#destroy", :id => "1")
    end

    it "routes nested purchased_deals" do
      get("/consumers/1/purchased_deals").should route_to("purchased_deals#index", :consumer_id => "1")
    end
  end
end
