require 'spec_helper'

describe "consumers/index.html.erb" do
  before(:each) do
    assign(:consumers, [
      stub_model(Consumer,
        :wedding_month => "Wedding Month",
        :wedding_year => 1,
        :postal_code => "Postal Code",
        :authenticateable_id => 1,
        :authenticateable_type => "Authenticateable Type"
      ),
      stub_model(Consumer,
        :wedding_month => "Wedding Month",
        :wedding_year => 2,
        :postal_code => "Postal Code",
        :authenticateable_id => 2,
        :authenticateable_type => "Authenticateable Type"
      )
    ])
  end

  it "renders a list of consumers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Wedding Month".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Postal Code".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Authenticateable Type".to_s, :count => 2
  end
end
