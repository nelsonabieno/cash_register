require 'json'
require_relative './app/product_store'
require_relative './app/basket'

class CashRegister
  class << self
    # displays the instructions and list of products registered
    def index(file_name)
      puts "*******WELCOME TO AMENITIZ CASH REGISTER*****"
      puts "***An interactive command line application***"
      puts "****************INSTRUCTIONS*****************"
      puts "Press s to continue shopping and q to quit"

      response_key = gets.chomp
      response_input = response_key.downcase

      if response_input == 'q'
        puts "Thank you for using our app. Goodbye!"
        return
      elsif response_input == 's'
        puts"================================"
        puts "Here is a list of our products"
        puts"================================"

        product_hash = ProductStore.get_products(file_name)
        product_codes = product_hash.keys

        product_codes.each do |product_code|
          product_details = product_hash[product_code]
          puts "product code: #{product_code} | name: #{product_details["name"]}   | price: #{product_details["price"]}"
        end

        CashRegister.read_items(product_hash)
      else
        puts "Invalid input! Please follow the instructions and try again"
      end
    end

    # reads input items
    def read_items(product_hash)
      puts "Add a list of the items to your basket by entering its product code seperated by comma e.g. SR1,SR1,CF1"
      input_list = gets.chomp
      CashRegister.get_items_to_basket(input_list, product_hash)
    end

    # adds input items to basket
    def get_items_to_basket(input_list, product_hash)
      if input_list.include?(',')
        basket_array = input_list.split(',')
        Basket.sort_items(basket_array, product_hash)
      else
        puts "Invalid input! Please follow the instructions and try again"
      end
    end
  end
end

CashRegister.index('./data/product_store.json')