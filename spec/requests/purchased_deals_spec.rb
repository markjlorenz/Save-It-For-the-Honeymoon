require 'spec_helper'

describe "PurchasedDeals" do
  describe "GET /purchased_deals" do
    it "should deny without login" do
      get purchased_deals_path
      response.status.should be(302)
    end
    it "should allow with login" do
     # sign_in_as mock_model(User, email:'test@test.com', consumer:mock_model(Consumer))
     # get purchased_deals_path
     # response.status.should be(200)
    end
  end
end
