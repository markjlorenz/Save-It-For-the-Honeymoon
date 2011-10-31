require "spec_helper"

describe MerchantsDealsController do
  describe "routing" do

    #it "routes to #index" do
      #get("/deals").should route_to("deals#index")
    #end

    #it "routes to #new" do
      #get("/deals/new").should route_to("deals#new")
    #end

    #it "routes to #show" do
      #get("/deals/1").should route_to("deals#show", :id => "1")
    #end

    #it "routes to #edit" do
      #get("/deals/1/edit").should route_to("deals#edit", :id => "1")
    #end

    #it "routes to #create" do
      #post("/deals").should route_to("deals#create")
    #end

    #it "routes to #update" do
      #put("/deals/1").should route_to("deals#update", :id => "1")
    #end

    #it "routes to #destroy" do
      #delete("/deals/1").should route_to("deals#destroy", :id => "1")
    #end
    
    #it "routes 'todays_deal' to deal#show" do
      #get('/todays_deal').should route_to("deals#show")
    #end

    it "routes nested deal from merchant" do
      get('/merchants/1/deals/1').should route_to("merchants_deals#show", id:"1", merchant_id:"1")
    end

    it "routes nested deal from merchant" do
      get('/merchants/1/deals/').should route_to("merchants_deals#index", merchant_id:"1")
    end
  end
end
