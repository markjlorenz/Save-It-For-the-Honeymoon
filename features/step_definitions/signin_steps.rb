Given /^a user exists with user name "([^"]*)" and password "([^"]*)"$/ do |user, pass|
  user = User.create! email:user, password:pass
  Consumer.create! user:user
end

Given /^a merchant exists with user name "([^"]*)" and password "([^"]*)"$/ do |user, pass|
  user = User.create! email:user, password:pass
  Merchant.create! user:user, name:'Test Merchant'
end

Given /^"([^"]*)" is signed in with password "([^"]*)"$/ do |user, pass|
  @current_user = User.find_by_email(user)
  visit '/sign_in'
  fill_in("session_email", with:user)
  fill_in("session_password", with:pass)
  click_button "session_submit"
end

Given /^no user is signed in$/ do 
  #uhm pending for many reasons
  visit '/'
end
