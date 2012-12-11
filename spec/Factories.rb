require 'factory_girl'

	FactoryGirl.define do
		factory :customer do
			firstName "Aliya"
			lastName "Hashim"
			email "aliya@aliya.com"
			phone "97444667532"
			address "PO Box 12345"
			password "123456"
		end

		factory :phone do
			brand "iphone"
			name "iphone"
			price "100" 
			quantityInStock "1"
		end
		
		factory :order do
		  customer_id "1"
		  phone_id "1"
		  quantity "1"
		end
	end