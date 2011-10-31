require 'spec_helper'

describe "deals/show.html.erb" do
  before(:each) do
    @deal = assign(:deal, stub_model(Deal,
      :merchant_id => 1,
      :copy => "<h1>headline of deal</h1><span>body of deal</span>",
      :copy_header => "copyheader",
      :copy_subheader => "copysubheader",
    ))
    @deal.image.stub(:url).and_return(Rails.root.to_s+'/spec/fixtures/test_image.jpg')
    assign(:allow_new_users, true)
    assign(:consumer, stub_model(Consumer,
      :wedding_month => "January",
      :wedding_year => 2012,
      :postal_code => "MyString",
      :user=> stub_model(User)
    ).as_new_record)
    assign(:months, [["January", 1],["February", 2],["March", 3],["April", 4],["May", 5],["June", 6],["July", 7],["August", 8],["September", 9],["October", 10],["November", 11],["December", 12]])
    assign(:years, [[2011, 2011],[2012, 2012],[2013, 2013]])

  end

  it "renders attributes in" do
    render
    assert_select "img[src*='test_image']"
  end

  it "shows new user form" do
    view.stub(:current_user).and_return(nil)
    render template:'deals/show', layout:'layouts/application'

    assert_select "input.buy-it"
    assert_select "#new_user_signup"
    assert_select "#signin"
    assert_select "[href='/sign_out']", false
  end

  it "doesn't show signed in users the signup form, and allows them signout" do
    view.stub(:current_user).and_return(mock_model(User, name_from_email:'Test', consumer:mock_model(Consumer)))
    render template:'deals/show', layout:'layouts/application'

    assert_select "input.buy-it"
    assert_select "#new_user_signup", false
    assert_select "#signin", false
    assert_select "[href='/sign_out']"
  end

end
