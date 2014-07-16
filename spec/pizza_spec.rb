require './pizza'

describe Pizza do
  describe '.initialize' do
    it 'records all of the toppings' do
      toppings = [
        Topping.new('mushrooms', vegetarian: true),
        Topping.new('pepperoni')
      ]
      pizza = Pizza.new(toppings)

      expect(pizza.toppings).to eq(toppings)
    end
    it 'defaults the toppings to cheese only, if the pizza has no toppings' do
      pizza = Pizza.new

      expect(pizza.toppings.size).to eq(1)
      expect(pizza.toppings.first.name).to eq('cheese')
    end
    it 'returns true if all toppings are vegetarian' do
      toppings = [
        Topping.new('mushrooms', vegetarian: true),
        Topping.new('pepperoni')
      ]
      pizza = Pizza.new(toppings)

      expect(pizza.vegetarian?).to eq(false)
    end
    it 'should add a new topping to the toppings array' do
      pizza = Pizza.new
      pepperoni = Topping.new('pepperoni')
      pizza.add_topping(pepperoni)

      expect(pizza.toppings.include? pepperoni).to eq(true)
    end
    it 'should return false if the pizza is not late' do
      pizza = Pizza.new
      pizza.deliver!

      expect(pizza.late?(Time.now + 40*60)).to eq(true)
    end
  end
  it "exists" do
    expect(Pizza).to be_a(Class)
  end
end

describe Topping do
  describe '.initialize' do
    it "sets the name of the topping" do
      topping = Topping.new('pineapple')
      expect(topping.name).to eq('pineapple')
    end
    it 'sets whether or not the topping is vegetarian' do
      topping = Topping.new 'bell peppers', vegetarian: true

      expect(topping.vegetarian).to eq(true)
    end
  end
  it "exists" do
    expect(Topping).to be_a(Class)
  end
end
