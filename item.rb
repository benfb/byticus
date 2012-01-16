class Item
  attr_accessor :drinkable, :eatable, :usable
  def initialize(name, drinkable, eatable, usable)
    @name = name
    @drinkable = drinkable
    @eatable = eatable
    @usable = usable
  end
end