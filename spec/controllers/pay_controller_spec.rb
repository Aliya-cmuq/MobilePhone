require 'spec_helper'

describe PayController do

  describe "GET 'paymentType'" do
    it "returns http success" do
      get 'paymentType'
      response.should be_success
    end
  end

  describe "GET 'creditCard'" do
    it "returns http success" do
      get 'creditCard'
      response.should be_success
    end
  end

  describe "GET 'cash'" do
    it "returns http success" do
      get 'cash'
      response.should be_success
    end
  end

end
