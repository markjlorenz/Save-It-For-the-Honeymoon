require 'spec_helper'

describe "deals/index.html.erb" do
  before(:each) do
    assign(:deals, [
      stub_model(Deal,
        :merchant_id => 1,
        :copy => "<h1>headline of deal</h1><span>body of deal</span>",
        :copy_header => "copyheader",
        :copy_subheader => "copysubheader"
      ),
      stub_model(Deal,
        :merchant_id => 1,
        :copy => "<h1>headline of deal</h1><span>body of deal</span>",
        :copy_header => "copyheader",
        :copy_subheader => "copysubheader"
      )
    ])
  end

  it "renders a list of deals" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    #assert_select "tr>td", :text => "<h1>headline of deal</h1><span>body of deal</span>", :count => 2
  end


  #it "shows new user form" do
    #render template:'deals/index', layout:'layouts/application'
    #assert_select "#new_user_signup"
  #end
  #
end
