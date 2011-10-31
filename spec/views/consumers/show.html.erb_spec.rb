require 'spec_helper'

describe "consumers/show.html.erb" do
  before(:each) do
    @consumer = assign(:consumer, stub_model(Consumer,
      :wedding_month => "Wedding Month",
      :wedding_year => 1,
      :postal_code => "Postal Code",
      :authenticateable_id => 1,
      :authenticateable_type => "Authenticateable Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Wedding Month/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Postal Code/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Authenticateable Type/)
  end
end
