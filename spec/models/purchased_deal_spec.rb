require 'spec_helper'

describe PurchasedDeal do
  it{should belong_to :consumer}
  it{should belong_to :deal}
  
  it "should require a deal and consumer" do
    @purchased_deal = PurchasedDeal.new
    @purchased_deal.should_not be_valid 

    @purchased_deal.consumer = mock_model(Consumer)
    @purchased_deal.should_not be_valid 

    @purchased_deal.deal = mock_model(Deal)
    @purchased_deal.should be_valid 
  end

  it "should have an identifier hash after save" do
    @purchased_deal = PurchasedDeal.new consumer:mock_model(Consumer), deal:mock_model(Deal)
    @purchased_deal.save
    @purchased_deal.identifier.should_not be_nil 
  end

  it "identifier should not change on update" do
    @purchased_deal = PurchasedDeal.new consumer:mock_model(Consumer), deal:mock_model(Deal)
    @purchased_deal.save
    identifier = @purchased_deal.identifier
    @purchased_deal.deal = mock_model(Deal)

    @purchased_deal.identifier.should == identifier
  end

  it "sets redeemed_at to current time if redeem= is called" do
    @purchased_deal = PurchasedDeal.new
    @purchased_deal.redeemed_at.should be_nil
    @purchased_deal.redeem=1
    @purchased_deal.redeemed_at.should_not be_nil

  end

end
