require 'spec_helper'

describe "deals/edit.html.erb" do
  before(:each) do
    @deal = assign(:deal, stub_model(Deal,
      :merchant_id => 1,
      :copy => "MyText"
    ))
  end

  it "renders the edit deal form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => deals_path(@deal), :method => "post" do
      assert_select "input#deal_merchant_id", :name => "deal[merchant_id]"
      assert_select "textarea#deal_copy", :name => "deal[copy]"
      assert_select "textarea[name='deal[copy_header]']"
      assert_select "textarea[name='deal[copy_subheader]']"
      assert_select "input[name='deal[image]']"    
    end
  end
end
