Given /^The current merchant has at least one purchased deal$/ do
  c = Consumer.create user:User.create(email:'consumer@test.com', password:'sekret')
  d = Deal.create merchant:@current_user.merchant, copy:'A test deal', copy_header:'test deal header', copy_subheader:'test deal subheader'
  PurchasedDeal.create consumer:c, deal:d
end

Given /^"([^"]*)" has at least one deal$/ do |email|
  Deal.create merchant:User.find_by_email(email).merchant, copy:'Example Deal Copy', copy_header:'Example Deal Header', copy_subheader:'Example Deal Subheader' if Deal.all.size == 0
end

When /^I submit a valid, unredeemed code$/ do
  code = @current_user.merchant.deals.last.purchased_deals.last.identifier
  When %[I fill in "purchased_deal_identifier" with "#{code}"]
  And %[I press "Redeem"]
end

When /^I submit an invalid code$/ do
  code = @current_user.merchant.deals.last.purchased_deals.last.identifier
  When %[I fill in "purchased_deal_identifier" with "X"]
  And %[I press "Redeem"]
end

When /^I submit an already redeemed code$/ do
  pd = @current_user.merchant.deals.last.purchased_deals.last
  code = pd.identifier
  pd.redeem=true
  pd.save

  When %[I fill in "purchased_deal_identifier" with "#{code}"]
  And %[I press "Redeem"]
end

