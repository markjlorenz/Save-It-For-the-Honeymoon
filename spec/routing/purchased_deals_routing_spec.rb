require "spec_helper"

describe PurchasedDealsController do
  describe "routing" do

    it "routes to #index" do
      get("/purchased_deals").should route_to("purchased_deals#index")
    end

    it "routes to #new" do
      get("/purchased_deals/new").should route_to("purchased_deals#new")
    end

    it "routes to #show" do
      get("/purchased_deals/1").should route_to("purchased_deals#show", :id => "1")
    end

    it "routes to #edit" do
      get("/purchased_deals/1/edit").should route_to("purchased_deals#edit", :id => "1")
    end

    it "routes to #create" do
      post("/purchased_deals").should route_to("purchased_deals#create")
    end

    it "routes to #update" do
      put("/purchased_deals/1").should route_to("purchased_deals#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/purchased_deals/1").should route_to("purchased_deals#destroy", :id => "1")
    end

    it "routes to #redeem" do
      put("/purchased_deals/redeem").should route_to("purchased_deals#redeem")
    end

  end
end
