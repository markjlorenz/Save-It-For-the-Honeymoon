require 'spec_helper'

describe "merchants/show.html.erb" do
  before(:each) do
    @merchant = assign(:merchant, stub_model(Merchant,
      :name => "Name",
      :email => "Email",
      :phone => "Phone",
      :contact_name => "Contact Name",
      :address => "MyText",
      :authenticateable_id => 1,
      :authenticateable_type => "Authenticateable Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Phone/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Contact Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Authenticateable Type/)
  end
end
