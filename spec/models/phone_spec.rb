require 'spec_helper'

describe Phone do
  	before(:each) do
    	@attr = { :brand => "Blackberry",
              :name => "Bold",
              :description => "9340",
              :price => "199.00",
              :quantityInStock => "2"}
  	end
  	describe "Chack the presence of brand, name, price, quantityInStock" do
      	it {should validate_presence_of(:brand)}
      	it {should validate_presence_of(:name)}
      	it {should validate_presence_of(:price)}
      	it {should validate_presence_of(:quantityInStock)}
    end

    describe "Association validation" do
        it "shoud have the correct associations: have many orders" do
          	should have_many(:orders)
        end
    end

    describe "Accept numbers only for price, quantityInStock" do
      it {should validate_numericality_of(:quantityInStock).only_integer}
      it {should validate_numericality_of(:quantityInStock)}
      it {should validate_numericality_of(:price)}

      it "should allow only valid numbers for quantityInStock" do
        should allow_value(0).for(:quantityInStock)
        should allow_value(1).for(:quantityInStock)
        should allow_value(100).for(:quantityInStock)
        should allow_value(500).for(:quantityInStock)
      end

      it "should not allow invalid numbers for quantityInStock" do
        should_not allow_value(-1).for(:quantityInStock)
        should_not allow_value(1.3844).for(:quantityInStock)
        should_not allow_value(-1.20987).for(:quantityInStock)
      end

      it "should allow only valid numbers for price" do
        should allow_value(1.50).for(:price)
        should allow_value(1.3844).for(:price)
        should allow_value(100.00).for(:price)
        should allow_value(500).for(:price)
      end

      it "should not allow invalid numbers for price" do
        should_not allow_value(0).for(:price)
        should_not allow_value(-1).for(:price)
        should_not allow_value(-1.20987).for(:price)
      end
    end
        describe "show only the iphones that are available" do
      it "should return the available phone IDs" do
   #     Phone.exsitedPhones.map{|v| v.name}.should == ["1"]
  #    Order.joins(:phones).where(:phones => { :name.nil? => false })
end
    end
    #   describe "show only the iphones that are available" do
    #     it "should return the available phone IDs" do
    #       Phone.exsitedPhones.map{|v| v.name}.should == ["1"]
    #       Order.joins(:phones).where(:phones => { :name.nil? => false })
    #     end
    # end

end
