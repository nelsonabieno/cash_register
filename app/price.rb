require_relative 'product_store'
require_relative 'discount'

class Price
  # calculate total price of products
  def self.calculate(product_count, product_hash)
    total_price = 0
    price_hash = {}

    product_count.each do |code, count|
      product_details = product_hash[code]
      price = Discount.public_send(product_details["discount"].to_sym, count, product_details["price"])
      price_hash[code] = price
      total_price += price
    end

    puts "total price: #{total_price}€"
    "#{total_price}€"
  end
end

