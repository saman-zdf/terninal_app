require_relative "../terminal_app"

# # test cases:
# 1. test if the customer instance is created and if the customer has a readable name
# 2. should diaplay a welcome msg
# 3. should read the menu 
# 4. should be able to receive user choice
# 5. should be able to get the item price 
# 6. should be able to choose the quantity
# 7. should be able to retrieve the final bill

describe CustomerOrder do
  before(:each) do 
    # this peice of code runs before each test case dfined in it block
    @customer = CustomerOrder.new("Saman")
  end
  it "instance must have readable name" do
    expect(@customer.name).to eq("Saman")
  end
  it "display welcome meg" do 
    msg = "welcome to Saman's kitchen, choose an item from the menu or enter exit to quit the menu."
    expect(@customer.welcome_msg).to eq(msg)
  end
  it "should display the menu." do
    menu = {"1. Nachos" => 10.00, "2. Pizza" => 15.00, "3. Fries" => 8.00}
    expect(@customer.menu).to eq(menu)
  end
  it "get item price based on user choice" do 
    user_choice = 1
    expect(@customer.get_item_price(user_choice)).to eq(10)
  end
  it "should get the quantity" do 
    expect(@customer.get_quantity).to be > 0
  end
  it "shold calculate the final bill" do 
    # define you test dataset
    user_choice = 1
    # to get total bill 
    final_bill = @customer.get_item_price(user_choice) * @customer.get_quantity
    expect(@customer.bill).to eq(final_bill)
  end
end