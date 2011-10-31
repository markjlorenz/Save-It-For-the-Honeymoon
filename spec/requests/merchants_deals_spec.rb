require 'spec_helper'

describe "Merchants Deals" do
  describe "Index redirects when one deal esists for a merchant" do
    it "has no deals" do
      merchant = Merchant.create
      raise StandardError if merchant.deals.size>0
      get merchant_deals_path(merchant)
      response.status.should be(200)
    end
    it "has one deal" do
      merchant = Merchant.create
      deal = Deal.create merchant:merchant, copy:'test copy', copy_header:'test copy header', copy_subheader:'test copy subheader'
      raise StandardError if merchant.deals.size>1
      get merchant_deals_path(merchant)
      response.status.should redirect_to(merchant_deal_path(merchant.id, deal.id))
    end
    it "has more than one deal" do
      merchant = Merchant.create
      deal = Deal.create merchant:merchant, copy:'test copy', copy_header:'test copy header', copy_subheader:'test copy subheader'
      deal_two = Deal.create merchant:merchant, copy:'test copy', copy_header:'test copy header', copy_subheader:'test copy subheader'
      get merchant_deals_path(merchant)
      response.status.should be(200)
    end
  end
end
