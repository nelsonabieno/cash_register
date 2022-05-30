require 'json'
require_relative './app/product_store'
require_relative './app/basket'

class CashRegister
  class << self
    # displays the instructions and list of products registered
    def index
      puts "*******WELCOME TO AMENITIZ CASH REGISTER*****"
      puts "***An interactive command line application***"
      puts "****************INSTRUCTIONS*****************"
      puts "Press s to continue shopping"

      response_key = gets.chomp

      if response_key.downcase == 's'
        puts"================================"
        puts "Here is a list of our products"
        puts"================================"
        product_store = ProductStore.get_products('./data/product_store.json')
        product_codes = product_store.keys

        product_codes.each do |product_code|
          product_details = product_store[product_code]
          puts "product code: #{product_code} | name: #{product_details["name"]}   | price: #{product_details["price"]}"
        end

        # reads input items
        puts "Add a list of the items to your basket by entering its product code seperated by comma"
        input_list = gets.chomp
        CashRegister.get_items_to_basket(input_list)
      else
        puts "Invalid input!"
      end
    end

    # adds input items to basket
    def get_items_to_basket(input_list)
      if input_list.include?(',')
        basket_array = input_list.split(',')
        Basket.sort_items(basket_array)
      else
        puts "Invalid input!"
      end
    end
  end
end

CashRegister.index