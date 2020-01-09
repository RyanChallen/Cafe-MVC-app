# Sets access to read variables 'name' and 'price' for each MenuItem
class MenuItem
  attr_reader :name,:price
  def initialize(name,price)
    @name = name
    @price = price
  end
end

#Initialises menu_items as an empty array
class Menu
  def initialize
    @menu_items = []    
  end

#Adding a new MenuItem into menu_items array, with values of name and price
  def add_item(name,price)
    @menu_items << MenuItem.new(name,price)
  end

#Iterates over each item in the menu_items array and returns its price
  def get_price(item_name)
    @menu_items.each do |item|
      if item.name == item_name
        return item.price
      end
    end
  end

#Displays Menu to user, listing each menu item in the format of name ... $price to two decimals then a blank line
  def display
    puts "Menu"
    puts "-----"
    @menu_items.each do |item|
      puts "#{item.name}    ... $%.2f" % item.price
    end
    puts
  end
end

#Provides methods for ordering menu items
class Order
  #Initialises order_items as an new empty hash 
  def initialize
    @order_items = Hash.new(0)
  end

  #Adding new item to order, targeting name and setting quantity
  def add_item(name, quantity)
    @order_items[name] += quantity
  end

  #Returns items ordered in this order
  def get_items
    return @order_items
  end
 
end

#Sets behaviours in Cafe
class Cafe
  #initialises access to and sets values for name to customer name, menu to a new menu, order to a blank order
  #ability to generate current menu and welcome customer
  def initialize(name, menu_items)
    @name = name
    @menu = Menu.new
    @order = nil
    populate_menu(menu_items)
    welcome
  end

  #personalised greeting for customer
  def welcome
    puts "Welcome to #{@name}!"
    puts
  end

  #iterates over the menu_items array and adds each to the menu for use in Cafe
  def populate_menu(menu_items)
    menu_items.each do |name,price|
      @menu.add_item(name,price)
    end
  end

  #if there is no order recorded, start new order and return it
  def get_order
    if !@order
      @order = Order.new
    end
    return @order
  end

  #add items to new order with each item and the quantity
  def add_to_order(item,quantity)
    get_order.add_item(item, quantity)
  end

  #prints menu for viewing by user
  def display_menu
    @menu.display
  end

  #starts order total sum at zero and for each item on the order, add the price multiplied quantity to total
  def order_total
    total = 0
    @order.get_items.each do |item,quantity|
      total += @menu.get_price(item) * quantity
    end
    return total
  end

  #display the customer's order to them in the format of quantity, item and then totals the order to two decimals 
  #followed by thank you/farewell
  def display_order
    puts
    if @order
      puts "Thank you! Here is your order:"
      puts "------------------------------"
      @order.get_items.each do |item_name,quantity|
        puts "#{quantity} #{item_name}"
      end
      puts "Total:    $%.2f" % order_total
    else
      puts "Thank you for coming!"
    end
    puts
  end

end

#provides ability for user order inputs, with shorthand, e.g. if typed 'l' return latte, provide invalid error handling
def validate_input(input)
  case input[0].downcase
  when "l"
    return "latte"
  when "s"
    return "scone"
  when "t"
    return "tea"
  when "d"
    return "done"
  else
    puts "Invalid input. Please choose again."
    return nil
  end
end


coder_cafe = Cafe.new("Coder Cafe", {"latte" => 4.00, "tea" => 3.00, "scone" => 5.00})
loop do
  coder_cafe.display_menu
  puts "What would you like to order? Enter (d)one when you are finished."
  input = gets.strip
  item = validate_input(input)
  break if item == "done"
  if item
    puts "How many would you like?"
    quantity = gets.to_i
    coder_cafe.add_to_order(item,quantity) if quantity > 0
  end
end

coder_cafe.display_order