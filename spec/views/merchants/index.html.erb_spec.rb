require 'spec_helper'

describe "merchants/index.html.erb" do
  before(:each) do
    assign(:merchants, [
      stub_model(Merchant,
        :name => "Name",
        :email => "Email",
        :phone => "Phone",
        :contact_name => "Contact Name",
        :address => "MyText",
        :authenticateable_id => 1,
        :authenticateable_type => "Authenticateable Type"
      ),
      stub_model(Merchant,
        :name => "Name",
        :email => "Email",
        :phone => "Phone",
        :contact_name => "Contact Name",
        :address => "MyText",
        :authenticateable_id => 1,
        :authenticateable_type => "Authenticateable Type"
      )
    ])
  end

  it "renders a list of merchants" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Contact Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Authenticateable Type".to_s, :count => 2
  end
end
