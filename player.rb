class Player  
  # Defines instance variables
  @@health = 100
  
  def name?
    @name = gets.chomp.capitalize
  end
  
  def name
    return @name
  end
  
  def health
    return @@health.to_s
  end
  
  def wound
    @@wound = rand(11)
    return @@wound.to_s
  end
  
  def heal
    @@heal = rand(11)
    return @@heal.to_s
  end
  
  def lose_health
    @@health = @@health - @@wound
  end
  
  def gain_health
    @@health = @@health + @@heal
  end
  
end