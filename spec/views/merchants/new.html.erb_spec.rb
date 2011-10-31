require 'spec_helper'

describe "merchants/new.html.erb" do
  before(:each) do
    assign(:merchant, stub_model(Merchant,
      :name => "MyString",
      :email => "MyString",
      :phone => "MyString",
      :contact_name => "MyString",
      :address => "MyText",
      :authenticateable_id => 1,
      :authenticateable_type => "MyString"
    ).as_new_record)
  end

  it "renders new merchant form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => merchants_path, :method => "post" do
      assert_select "input#merchant_name", :name => "merchant[name]"
      assert_select "input#merchant_email", :name => "merchant[email]"
      assert_select "input#merchant_phone", :name => "merchant[phone]"
      assert_select "input#merchant_contact_name", :name => "merchant[contact_name]"
      assert_select "textarea#merchant_address", :name => "merchant[address]"
      assert_select "input#merchant_authenticateable_id", :name => "merchant[authenticateable_id]"
      assert_select "input#merchant_authenticateable_type", :name => "merchant[authenticateable_type]"
    end
  end
end
