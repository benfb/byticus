class Player  
  # Defines instance variables
  $health = 100
  
  def name?
    @name = gets.chomp.capitalize
  end
  
  def name
    return @name
  end
end