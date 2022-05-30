# Amenitiz Cash Register
## Description
An interactive command line cash register application that receives product items from user and calculates the total price. 

### Assumptions

**Products Registered**
| Product Code | Name | Price |  
|--|--|--|
| GR1 |  Green Tea | 3.11€ |
| SR1 |  Strawberries | 5.00 € |
| CF1 |  Coffee | 11.23 € |

**Special conditions**

- The CEO is a big fan of buy-one-get-one-free offers and green tea.
  He wants us to add a  rule to do this.

- The COO, though, likes low prices and wants people buying strawberries to get a price  discount for bulk purchases.
  If you buy 3 or more strawberries, the price should drop to 4.50€.

- The VP of Engineering is a coffee addict.
  If you buy 3 or more coffees, the price of all coffees should drop to 2/3 of the original price.

Our check-out can scan items in any order, and because the CEO and COO change their minds  often, it needs to be flexible regarding our pricing rules.

**Test data**
| Basket | Total price expected |  
|--|--|
| GR1,GR1 |  3.11€ |
| SR1,SR1,GR1,SR1 |  16.61€ |   (3*4.5)= 13.5 + 3.11 = 16.61
| GR1,CF1,SR1,CF1,CF1 |  30.57€ |

# Prequisites
The following tools need to be installed
* [Git](https://github.com/git-guides/install-git "Git")
* [Ruby](https://www.ruby-lang.org/en/documentation/installation/ "Ruby")

# Setup
i. Open your terminal and install git and run `git clone git@github.com:nelsonabieno/cash_register.git` <br>
ii. Change directory into cash_register folder i.e. `cd cash_register` <br>
iii. Run `bundle install` to install the gems

# Running the App
To run the app: <br>
i.  Before you run the command below, make sure you are in the cash_register directory i.e. `cd cash_register` <br>
ii. Run the command `ruby cash_register.rb` <br>
iii. Follow the prompt i.e. press key `s` to continue shopping and  `q` to quit <br>
iv. Enter the list of the product items to your basket by entering its product code seperated by comma in any order e.g. `SR1,SR1,GR1,SR1,CF1`. Note `GR1` is the product code for Green Tea, `SR1` is the product code Strawberry and `CF1` is the product code for Coffee

# Running Test
Test is written with `rspec` test library <br> To run test, run the command `rspec  ./spec/cash_register_spec.rb`

