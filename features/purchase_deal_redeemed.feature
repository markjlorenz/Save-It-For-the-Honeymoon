Feature: A merchant redeems codes from their offer
	In order for merchants to redeem deals they need to see the deal page, 
	enter a deal to redeem, and get success or an appropriate error message

	Background:
		Given a merchant exists with user name "merchant@test.com" and password "sekret"
		And "merchant@test.com" has at least one deal
		And "merchant@test.com" is signed in with password "sekret"  
		And The current merchant has at least one purchased deal
		And I am on the merchants deal page

	Scenario: a merchant successfully redeems a deal
		When I submit a valid, unredeemed code
		Then I should see "Deal Redeemed"

	Scenario: a merchant tries to redeem a deal and submits an invalid redemption code
		When I submit an invalid code
		Then I should see "Invalid"

	Scenario: a merchant tries to redeem a deal that was already redeemed
		When I submit an already redeemed code
		Then I should see "Already Been Redeemed"

	
