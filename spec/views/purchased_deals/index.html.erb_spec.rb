require 'spec_helper'

describe "purchased_deals/index.html.erb" do
  before(:each) do
    @deal = mock_model(Deal, 
      image:mock(:image), 
      copy: "<h1>headline of deal</h1><span>body of deal</span>",
      copy_header: "copyheader",
      copy_subheader: "copysubheader",
      merchant:mock_model(Merchant, 
        name:'test merchant'
       ))
    @deal.image.stub(:url).and_return(Rails.root.to_s+'/spec/fixtures/test_image.jpg')
    assign(:purchased_deals, [
      stub_model(PurchasedDeal,
        :consumer_id => 1,
        deal:@deal
      ),
      stub_model(PurchasedDeal,
        :consumer_id => 1,
        deal:@deal
      )
    ])
  end

  it "renders a list of purchased_deals" do
    render
    #assert_select "tr>td", :text => 1.to_s, :count => 2
    #assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
