require_relative 'product_store'
require_relative 'discount'

class Price
  # calculate total price of products
  def self.calculate(product_count)
    total_price = 0
    product_store = ProductStore.get_products('./data/product_store.json')
    price_hash = {}

    product_count.each do |code, count|
      product_details = product_store[code]
      price = Discount.public_send(product_details["discount"].to_sym, count, product_details["price"])
      price_hash[code] = price
      total_price += price
    end
    total_price
    puts "total_price #{total_price}€"
    "#{total_price}€"
  end
end

