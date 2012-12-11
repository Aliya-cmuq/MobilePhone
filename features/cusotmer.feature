Feature: Customer
As a customer
I want to have access to certain information 
So I can view, buy and buy a cellphone

Background:
       Given I created a customer, phone and order


Scenario: Do not see the default rails page
	  Given I am in the home page
      Then I should not see "You'r riding Ruby on Rails"
      And I should not see "About your application's environment"
      And I should not see "Create you data base"

Scenario: View "About Us"
	  Given I am in the home page
	  When I follow the "About Us" link
	  Then I should see "Mobile Retailer :: About Us" in the "title"


Scenario: View "Contact Us"
	  Given I am in the home page
	  When I follow the "Contact Us" link
	  Then I should see "Mobile Retailer :: Contact Us" in the "title"


Scenario: View "Privacy Policy"
	  Given I am in the home page
	  When I follow the "Privacy Policy" link
	  Then I should see "Mobile Retailer :: Privacy Policy" in the "title"
	


Scenario: View Home information in header
	Given I am in the home page
	Then I should be able to see "Home" in the "header"

Scenario: View Home information in footer
	Given I am in the home page
	Then I should see "Home" in the "footer"



	
	
	
Scenario: creating a customer
	Given I follow the new customer path
	When I enter "Asma" in 'Firstname' 
	And I enter "Al-kubaisi" in 'Lastname'
	And I enter "POOBox 12345" in 'Address'
	And I enter "aliya@aliya.com" in 'Email'
	And I enter "97444667532" in 'Phone'
	And I click on "Create Customer"
	Then I should be seeing "Asma Al-kubaisi was successfully created."

Scenario: edit customer
	Given I go to the customers page
	When I follow the "Edit" link for "Asma Al-kubaisi"
	And I change the email address "aliya@aliya.com" to "asma@aliya.com"
	And I click the button "Update Customer"
	Then in the page I should see "Asma Al-kubaisi was successfully updated."

Scenario: delete customer
	Given I am in the customers page
	When I follow the "Destroy" link for "Asma Al-kubaisi"
	Then I should not see "Asma Al-kubaisi"


Scenario: creating a phone
	Given I follow the new phone path
	When I enter "iphone" in 'Brand' 
	And I enter "iphone5" in 'Name'
	And I enter "100" in 'Price'
	And I enter "1" in 'Quantity'
	And I enter "anything" in 'Description'
	And I click on "Create Phone"
	Then I should be seeing "new phone was successfully created."





	