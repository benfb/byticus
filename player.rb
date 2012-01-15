class Player  
  # Defines instance variables
  attr_reader :wound, :name, :health, :healing, :rest_healing, :infected_hurting
  
  def initialize(name, health)
    @name = name
    @health = health
  end
  
  def name?
    @name = gets.chomp.capitalize
  end
  
  def heal
    @healing = rand(11)
    @health = @health + @healing
  end
  
  def hurt
    @wound = rand(11)
    @health = @health - @wound
  end
  
  def infected
    @infected_hurting = rand(5)*5
    @health = @health - @infected_hurting
  end
  
  def rest
    @rest_healing = rand(5)*3
    @health = @health + @rest_healing
  end
end