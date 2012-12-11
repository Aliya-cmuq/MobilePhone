require 'spec_helper'

describe SessionsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end
  
  it "should have the right title" do
#    get :new
#    response.should have_selector("title", :content => "Sign in")
  end
  
  
  describe "valid signing" do
	before(:each) do
		@customer = FactoryGirl.create(:customer)
		@attr = {:email => @customer.email, :password => @customer.password}
	end
	
	it "should sign the customer in" do
		post :create, :session => @attr
		controller.current_customer.should == @customer
		controller.should be_signed_in
	end
	
	it "should redirect to the user show page" do
		post :create, :session => @attr
		response.should redirect_to(customer_path(@customer))
	end
	
	end 
end
