require_relative '../cash_register'

RSpec.describe CashRegister do
  context "adding products GR1,GR1 to basket should calculate total price" do
    it { expect(CashRegister.get_items_to_basket("GR1,GR1")).to eql '3.11€' }
  end

  context "adding products SR1,SR1,GR1,SR1 should calculate total price" do
    it { expect(CashRegister.get_items_to_basket("SR1,SR1,GR1,SR1")).to eql '16.61€' }
  end

  context "adding products GR1,CF1,SR1,CF1,CF1 should calculate total price" do
    it { expect(CashRegister.get_items_to_basket("GR1,CF1,SR1,CF1,CF1")).to eql '30.57€' }
  end
end