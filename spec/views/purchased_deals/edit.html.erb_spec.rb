require 'spec_helper'

describe "purchased_deals/edit.html.erb" do
  before(:each) do
    @purchased_deal = assign(:purchased_deal, stub_model(PurchasedDeal,
      :consumer_id => 1,
      :deal_id => 1
    ))
  end

  it "renders the edit purchased_deal form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => purchased_deals_path(@purchased_deal), :method => "post" do
      assert_select "input#purchased_deal_consumer_id", :name => "purchased_deal[consumer_id]"
      assert_select "input#purchased_deal_deal_id", :name => "purchased_deal[deal_id]"
    end
  end
end
