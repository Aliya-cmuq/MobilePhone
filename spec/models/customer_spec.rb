require 'spec_helper'

describe Customer do
  	describe Customer do
    	before(:each) do
      		@attr = { :firstName => "Aliya",
                :lastName => "Hashim ",
                :adress => "POBox 12345",
                :phone => "974-44872456",
                :email => "ahashim@example.com"}
    	end
    	describe "Chack the presence of firts name, last name, email, phone" do
      		it {should validate_presence_of(:firstName)}
      		it {should validate_presence_of(:lastName)}
      		it {should validate_presence_of(:email)}
      		it {should validate_presence_of(:phone)}
    	end
    	describe "Email validation" do
      		describe "Validate good email" do
      		  	it {should allow_value("aliya@aliya.com").for(:email)}
        		it {should allow_value("aliya123@aliya123.gov").for(:email)}
        		it {should allow_value("aliya-hashim-11@aliya.com").for(:email)}
        		it {should allow_value("a1990@aliya.org").for(:email)}
      		end
      		describe "Reject bad email" do
	        	it {should_not allow_value("aliya.fred.edu").for(:email)}
    	    	it {should_not allow_value("aliya.com").for(:email)}
        		it {should_not allow_value("655437.fred.org").for(:email)}
	        	it {should_not allow_value("aliy,hashim@fred.com").for(:email)}
    	    	it {should_not allow_value("aliy,com").for(:email)}
        		it {should_not allow_value("fred").for(:email)}
	        	it {should_not allow_value("fred@fred,com").for(:email)}
    	    	it {should_not allow_value("fred@fred.uk").for(:email)}
        		it {should_not allow_value("aliya hashim@fred.com").for(:email)}
        		it {should_not allow_value("fred.fred.com").for(:email)}
      		end
			
			it "should reject duplicate email addresses" do
				Customer.create!(@attr)
				customer_with_duplicate_email = Customer.new(@attr)
				customer_with_duplicate_email.should_not be_valid
			end
			
			it "should reject duplicate email addresses identical up to case" do
				upcased_email = @attr[:email].upcase
				Customer.create!(@attr.merge(:email => upcased_email))
				customer_with_duplicate_email = Customer.new(@attr)
				customer_with_duplicate_email.should_not be_valid
			end		
			
			
    	end
		
		describe "Password validations" do
			it "should require a password" do
				Customer.new(@attr.merge(:password => "", :password_confirmation => "")).should_not be_valid
			end
		
			it "should require a matching password confirmation" do
				Customer.new(@attr.merge(:password_confirmation => "invalid")).should_not be_valid
			end
			
			it "should reject short passwords" do
				short = "a" * 5
				short_hash = @attr.merge(:password => short, :password_confirmation => short)
				Customer.new(short_hash).should_not be_valid
			end
			
			it "should reject long passwords" do
				long = "a" * 41
				long_hash = @attr.merge(:password => long, :password_confirmation => long)
				Customer.new(long_hash).should_not be_valid
			end
		end
		
		describe "Password Encryption" do
			before(:each) do
				@customer = Customer.create!(@attr)
			end
			
			it "should have an encrypted password attribute" do
				@customer.should respond_to(:encrypted_password)
			end
			
			it "should set the encrypted password" do
				@customer.encrypted_password.should_not be_blank
			end
		end
		
		describe "Authenticate method" do
			it "should return nil on email/password mismatch" do
				wrong_password_customer = Customer.authenticate(@attr[:email], "wrongpass")
				wrong_password_customer.should be_nil
			end
			
			it "should return nil for an email address with no user" do
				nonexistent_customer = Customer.authenticate(@attr[:email], attr[:password])
				nonexistent_customer.should == @customer
			end
		end
		
    	describe "Phone validation" do
      		describe "Validate good phone number" do
        		it {should allow_value("97497449744").for(:phone)}
        		it {should allow_value("974-9744-9744").for(:phone)}
        		it {should allow_value("974-97449744").for(:phone)}
        		it {should allow_value("97449744").for(:phone)}
        		it {should allow_value("9744-9744").for(:phone)}
      		end
      		describe "Reject bad phone number" do
        		it {should_not allow_value("+(974)97449744").for(:phone)}
        		it {should_not allow_value("+(974)974-497-44").for(:phone)}
        		it {should_not allow_value("9744").for(:phone)}
        		it {should_not allow_value("9744qatar").for(:phone)}
        		it {should_not allow_value("974-qatar-974").for(:phone)}
        		it {should_not allow_value("(974)4").for(:phone)}
      		end
    	end
    	describe "Association validation" do
        	it "shoud have the correct associations: have many orders" do
          		should have_many(:orders)
        	end
      	end
    end
end
