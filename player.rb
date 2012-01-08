class Player  
  # Defines instance variables
  attr_reader :health, :name
  
  @health = 100
  
  def name?
    @name = gets.chomp.capitalize
  end
  
  def heal
    heal = rand(11)
    @health = @health + heal
  end
  
  def hurt
    wound = rand(11)
    @health = @health - wound
  end
  
  def infected
    @health = @health - rand(5)*5
    return @health.to_s
  end
end