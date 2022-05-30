require_relative 'product_store'
require_relative 'price'

class Basket
  # sort and count items by their product codes
  def self.sort_items(basket)
    unknown_products = []
    product_count = {}
    product_hash = ProductStore.get_products('./data/product_store.json')

    basket.each do |item|
      code = item.upcase
      if product_hash.has_key? code
        if product_count.has_key? code
          product_count[code] += 1
        else
          product_count[code] = 1
        end
      else
        unknown_products << code
      end
    end

    Price.calculate(product_count)
  end
end
