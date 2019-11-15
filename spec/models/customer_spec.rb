require 'spec_helper'

class CustomerSpec
  describe "Test Customer Model" do
    it "should accept the valid customer record" do
      record = {"latitude": 53.2451022,"longitude": -6.238335,"name": "Ian Kehoe","user_id": 4}
      customer = Customer.new(record)
      expect(customer.latitude).to eq(record[:latitude])
      expect(customer.longitude).to eq(record[:longitude])
      expect(customer.user_id).to eq(record[:user_id])
      expect(customer.name).to eq(record[:name])
    end

    it "should not accept the customer record without mandatory params" do
      record = {"name": "Ian Kehoe","user_id": 4}
      expect{Customer.new(record)}.to raise_exception(Exception, "Invalid Customer Record")

    end
  end
end