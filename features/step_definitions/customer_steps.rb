require 'factory_girl'
Given /^I created a customer, phone and order$/ do
  @asma = FactoryGirl.create(:customer, :firstName => "Asma", :lastName => "Al-kubaisi")
  @iphone = FactoryGirl.create(:phone, :brand => "iphone", :name => "iphone")
  @order = FactoryGirl.create(:order) # express the regexp above with the code you wish you had
end

Given /^I am in the home page$/ do
  visit root_path # express the regexp above with the code you wish you had
end

Then /^I should not see "(.*?)"$/ do |arg1|
  page.should_not have_content arg1 # express the regexp above with the code you wish you had
end

When /^I follow the "(.*?)" link$/ do |arg1|
  page.should have_link arg1
  click_link arg1 # express the regexp above with the code you wish you had
end

Then /^I should see "(.*?)" in the "(.*?)"$/ do |arg1, arg2|
 # save_and_open_page
  page.should have_selector(arg2, :text => arg1)  # express the regexp above with the code you wish you had
end



Then /^I should be able to see "(.*?)" in the "(.*?)"$/ do |arg1, arg2|
  #page.should have_xpath("//#{arg2}", :text => arg1) # express the regexp above with the code you wish you had
  page.should have_selector(arg2, :text => arg1)
end

Given /^I follow the new customer path$/ do
  visit new_customer_path # express the regexp above with the code you wish you had
end

When /^I enter "(.*?)" in 'Firstname'$/ do |arg1|
  fill_in 'Firstname', :with => arg1 # express the regexp above with the code you wish you had
end

When /^I enter "(.*?)" in 'Lastname'$/ do |arg1|
  fill_in 'Lastname', :with => arg1 # express the regexp above with the code you wish you had
end

When /^I enter "(.*?)" in 'Address'$/ do |arg1|
  fill_in 'Address', :with => arg1 # express the regexp above with the code you wish you had
end

When /^I enter "(.*?)" in 'Email'$/ do |arg1|
  fill_in 'Email', :with => arg1 # express the regexp above with the code you wish you had
end

When /^I enter "(.*?)" in 'Phone'$/ do |arg1|
  fill_in 'Phone', :with => arg1 # express the regexp above with the code you wish you had
end

When /^I click on "(.*?)"$/ do |arg1|
  click_button arg1 # express the regexp above with the code you wish you had
end

Then /^I should be seeing "(.*?)"$/ do |arg1|
  #page.should have_content arg1 # express the regexp above with the code you wish you had
end

Given /^I go to the customers page$/ do
  visit customers_path # express the regexp above with the code you wish you had
end

When /^I follow the "(.*?)" link for "(.*?)"$/ do |arg1, arg2|
  #within do
     # within('tr', :text => arg2) do
      # find('th', :text => arg1).click
     # end
   # end
  find(:xpath, "//tr[contains(.,'#{arg2}')]").click_link arg1 # express the regexp above with the code you wish you had
end

When /^I change the email address "(.*?)" to "(.*?)"$/ do |arg1, arg2|
  fill_in "Phone", :with => arg2 # express the regexp above with the code you wish you had
end

When /^I click the button "(.*?)"$/ do |arg1|
  click_button arg1 # express the regexp above with the code you wish you had
end

Then /^in the page I should see "(.*?)"$/ do |arg1|
  #page.should have_content(arg1) # express the regexp above with the code you wish you had
end

Given /^I am in the customers page$/ do
  visit customers_path # express the regexp above with the code you wish you had
end

Given /^I follow the new phone path$/ do
  visit new_phone_path # express the regexp above with the code you wish you had
end

When /^I enter "(.*?)" in 'Brand'$/ do |arg1|
  fill_in 'Brand', :with => arg1 # express the regexp above with the code you wish you had
end

When /^I enter "(.*?)" in 'Name'$/ do |arg1|
  fill_in 'Name', :with => arg1 # express the regexp above with the code you wish you had
end

When /^I enter "(.*?)" in 'Price'$/ do |arg1|
  fill_in 'Price', :with => arg1 # express the regexp above with the code you wish you had
end

When /^I enter "(.*?)" in 'Quantity'$/ do |arg1|
  fill_in 'Quantity', :with => arg1 # express the regexp above with the code you wish you had
end

When /^I enter "(.*?)" in 'Description'$/ do |arg1|
  fill_in 'Description', :with => arg1 # express the regexp above with the code you wish you had
end

