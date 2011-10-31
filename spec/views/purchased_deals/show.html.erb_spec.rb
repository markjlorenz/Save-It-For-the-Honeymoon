require 'spec_helper'

describe "purchased_deals/show.html.erb" do
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

    @purchased_deal = assign(:purchased_deal, stub_model(PurchasedDeal,
      :consumer_id => 1,
      :deal => @deal
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
