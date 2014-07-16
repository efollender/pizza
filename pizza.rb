class Pizza
  attr_accessor :toppings
  def initialize(toppings=[Topping.new('cheese', vegetarian:true)])
    @toppings = toppings
  end
  def vegetarian?
    vegetarian = @toppings.first.vegetarian
    @toppings.all? {|x| x.vegetarian == true}
  end
  def add_topping(new_topping)
    @toppings << new_topping
  end
  def deliver!
    @delivery_time = Time.now + 30*60
  end
  def late?(now=Time.now)
    if @delivery_time < now
      return true
    else
      return false
    end
  end
end

class Topping
  attr_accessor :name, :vegetarian
  def initialize(name, vegetarian: false)
    @name = name
    @vegetarian = vegetarian
  end
end
