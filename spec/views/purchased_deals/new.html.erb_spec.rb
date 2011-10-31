require 'spec_helper'

describe "purchased_deals/new.html.erb" do
  before(:each) do
    assign(:purchased_deal, stub_model(PurchasedDeal,
      :consumer_id => 1,
      :deal_id => 1
    ).as_new_record)
  end

  it "renders new purchased_deal form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => purchased_deals_path, :method => "post" do
      assert_select "input#purchased_deal_consumer_id", :name => "purchased_deal[consumer_id]"
      assert_select "input#purchased_deal_deal_id", :name => "purchased_deal[deal_id]"
    end
  end
end
