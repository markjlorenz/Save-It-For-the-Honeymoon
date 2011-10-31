require 'spec_helper'

describe "consumers/edit.html.erb" do
  before(:each) do
    @consumer = assign(:consumer, stub_model(Consumer,
      :wedding_month => "January",
      :wedding_year => 2012,
      :postal_code => "MyString",
    ))
    assign(:months, [["January", 1],["February", 2],["March", 3],["April", 4],["May", 5],["June", 6],["July", 7],["August", 8],["September", 9],["October", 10],["November", 11],["December", 12]])
    assign(:years, [[2011, 2011],[2012, 2012],[2013, 2013]])

  end

  it "renders the edit consumer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => consumers_path(@consumer), :method => "post" do
      assert_select "select#consumer_wedding_month", :name => "consumer[wedding_month]"
      assert_select "select#consumer_wedding_year", :name => "consumer[wedding_year]"
      assert_select "input#consumer_postal_code", :name => "consumer[postal_code]"
    end
  end
end
