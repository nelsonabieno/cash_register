class Discount
  class << self
    # CEO discount, calculate total price based on buy one get one free
    # else registered normal price is used
    def ceo_discount(count, price)
      total_price = 0
      if count == 1
        total_price = price
      else
        total_price = price * (count - 1)
      end
      total_price
    end

    # COO discount, calculate total price for bulk purchases of 3 and above items
    # else registered normal price is used
    def coo_discount(count, price)
      total_price = 0
      if count >= 3
        total_price = count * 4.50
      else
        total_price = count * price
      end
      total_price
    end

    # VP discount, calculate total price for bulk purchases of 3 and above items
    # else registered normal price is used
    def vp_discount(count, price)
      total_price = 0
      if count >= 3
        total_price = count * ((2.0/3.0) * price)
      else
        total_price = count * price
      end
      total_price
    end
  end
end