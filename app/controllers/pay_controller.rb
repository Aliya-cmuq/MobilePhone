class PayController < ApplicationController
  def paymentType
    @title = "Payment Type"
  end

  def creditCard
    @title = "Credit Card"
  end

  def cash
    @title = "Cash"
  end
end
