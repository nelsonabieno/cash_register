require_relative '../cash_register'
require_relative '../app/product_store'

RSpec.describe CashRegister do
  let (:products) { ProductStore.get_products('./data/product_store.json') }

  context "adding products GR1,GR1 to basket should calculate total price" do
    it { expect(CashRegister.get_items_to_basket("GR1,GR1", products)).to eql '3.11€' }
  end

  context "adding products SR1,SR1,GR1,SR1 to basket should calculate total price" do
    it { expect(CashRegister.get_items_to_basket("SR1,SR1,GR1,SR1", products)).to eql '16.61€' }
  end

  context "adding products GR1,CF1,SR1,CF1,CF1 to basket should calculate total price" do
    it { expect(CashRegister.get_items_to_basket("GR1,CF1,SR1,CF1,CF1", products)).to eql '30.57€' }
  end

  context "adding products GR1,SR1,GR1,GR1,CF1 to basket should calculate total price" do
    it { expect(CashRegister.get_items_to_basket("GR1,SR1,GR1,GR1,CF1", products)).to eql '22.45€' }
  end

  context "adding an invalid input" do
    it { expect(CashRegister.get_items_to_basket("green tea", products)).to eql 'Invalid input! Please follow the instructions and try again' }
  end

  context "adding a single product to basket should calculate total price" do
    it { expect(CashRegister.get_items_to_basket("CF1", products)).to eql '11.23€' }
  end

  context "adding a list of registered and unregistered products should calculate total price of registered products only" do
    it { expect(CashRegister.get_items_to_basket("SR1,SR1,GR1,SR1,YT1", products)).to eql '16.61€' }
  end
end