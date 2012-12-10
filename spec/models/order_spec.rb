require 'spec_helper'

describe Order do
    before(:each) do
          @attr = { :customer_id => "1",
                :phone_id => "1",
                :quantity => "2"}
    end
    describe "Chack the presence of firts customer_id, phone_id, quantity" do
      it {should validate_presence_of(:customer_id)}
      it {should validate_presence_of(:phone_id)}
      it {should validate_presence_of(:quantity)}
    end
    describe "Association validation" do
      it "shoud have the correct associations: belongs to customers" do
        should belong_to(:customer)
      end
      it "shoud have the correct associations: belongs to phones" do
        should belong_to(:customer)
      end
    end

    describe "Accept numbers only for customer_id, phone_id, quantity" do
      it {should validate_numericality_of(:customer_id).only_integer}
      it {should validate_numericality_of(:customer_id)}
      it {should validate_numericality_of(:phone_id).only_integer}
      it {should validate_numericality_of(:phone_id)}
      it {should validate_numericality_of(:quantity).only_integer}
      it {should validate_numericality_of(:quantity)}

      it "should allow only valid numbers for customer_id" do
        should allow_value(1).for(:customer_id)
        should allow_value(100).for(:customer_id)
        should allow_value(500).for(:customer_id)
      end

      it "should not allow invalid numbers for customer_id" do
        should_not allow_value(0).for(:customer_id)
        should_not allow_value(-1).for(:customer_id)
        should_not allow_value(1.3844).for(:customer_id)
        should_not allow_value(-1.20987).for(:customer_id)
      end

      it "should allow only valid numbers for phone_id" do
        should allow_value(1).for(:phone_id)
        should allow_value(100).for(:phone_id)
        should allow_value(500).for(:phone_id)
      end

      it "should not allow invalid numbers for phone_id" do
        should_not allow_value(0).for(:phone_id)
        should_not allow_value(-1).for(:phone_id)
        should_not allow_value(1.3844).for(:phone_id)
        should_not allow_value(-1.20987).for(:phone_id)
      end

      it "should allow only valid numbers for quantity" do
        should allow_value(1).for(:quantity)
        should allow_value(100).for(:quantity)
        should allow_value(500).for(:quantity)
      end

      it "should not allow invalid numbers for quantity" do
        should_not allow_value(0).for(:quantity)
        should_not allow_value(-1).for(:quantity)
        should_not allow_value(1.3844).for(:quantity)
        should_not allow_value(-1.20987).for(:quantity)
      end
    end

     describe "show only the iphones that are available" do
       it "should return the available phone IDs" do
  #       Order.exsitedPhones.map{|v| v.name}.should == ["1"]
    #     Order.exsitedPhones.map{|v| v.name}.should == ["1"]
   #    Order.joins(:phones).where(:phones => { :name.nil? => false })
        end
        it "should have the right phone id" do
          
        end
     end

   #   describe "show only the iphones that are available" do
   #     it "should return the available phone IDs" do
   #       Order.exsitedPhones.map{|v| v.name}.should == ["1"]
   # #    Order.joins(:phones).where(:phones => { :name.nil? => false })
   #      end
   #      it "should have the right phone id" do
          
   #      end
   #   end

end
