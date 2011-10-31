Feature: a new user vists the site and signs up
	in order to get new users
	when an unlogged in users comes to the website
	then they should see the sign-up dialog
	and be able to signup for the website 

	Background:
		Given I have at least one deal
		Given no user is signed in

	Scenario: a new user is asked to signup
		Given I am on show deal
		Then I should see "New Here?"
		And I should see "Sign In: "
		And I should not see "Sign out"

	@javascript
	Scenario: new user signup failure
		Given I am on show deal
		When I fill in "consumer[user_attributes][email]" with "test@test.com"
		And I press "consumer_submit"
		Then I should see "1 error prohibited"

	@javascript
	Scenario: new user signup success
		Given I am on show deal
		When I fill in "consumer[user_attributes][email]" with "test@test.com"
		And I fill in "consumer[user_attributes][password]" with "sekret"
		And I select "February" from "consumer[wedding_month]"
		And I select "2013" from "consumer[wedding_year]"
		And I press "consumer_submit"
		Then I should see "Look For Our Emails"
		And I should not see an element "#new_user_signup"

	@javascript
	Scenario: An existing user signs in
		Given a user exists with user name "sign-in-test@test.com" and password "sekret"
		And I am on show deal
		When I follow "Or, Sign In"
		And I fill in "session[email]" with "sign-in-test@test.com"
		And I fill in "session[password]" with "sekret"
		And I press "session_submit"
		Then I should see "You're Logged In!"
		And I should not see an element "#new_user_signup"
		And I should not see an element "#signin"

	@javascript
	Scenario: An existing user tries to sign in and fails, but then succeeds
		Given a user exists with user name "sign-in-test@test.com" and password "sekret"
		And I am on show deal
		When I follow "Or, Sign In"
		And I fill in "session[email]" with "bad@email.com"
		And I fill in "session[password]" with "bad"
		And I press "session_submit"
		And I fill in "session[email]" with "sign-in-test@test.com"
		And I fill in "session[password]" with "sekret"
		And I press "session_submit"
		Then I should see "You're Logged In!"
		And I should not see an element "#signin"

	@javascript
	Scenario: A previously signed in user comes back to the website (checking session functionality)
		Given a user exists with user name "sign-in-test@test.com" and password "sekret"
		And "sign-in-test@test.com" is signed in with password "sekret"  
		When I am on show deal
		Then I should see "Sign out"
		And I should not see an element "#signin"
		And I should not see an element "#new_user_signup"

	Scenario: A signed in user buys the deal
		Given a user exists with user name "sign-in-test@test.com" and password "sekret"
		And "sign-in-test@test.com" is signed in with password "sekret"  
		When I am on show deal
		And I press the button with css "input.buy-it"  
		Then I should see "Thanks for Purchasing"


