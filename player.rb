class Player  
  # Defines instance variables
<<<<<<< HEAD
  attr_reader :wound, :name, :health, :healing, :rest_healing, :infected_hurting, :denarii
  attr_accessor :location
  
  def initialize(name, health, denarii, location)
    @name = name
    @health = health
    @denarii = denarii
    @location = location
  end
  
  def name?
    @name = gets.chomp.capitalize
=======
<<<<<<< HEAD
  @@health = 100
  
  def name?
    @name = gets.chomp.capitalize
=======
  attr_reader :wound, :name, :health, :healing, :rest_healing, :infected_hurting, :denarii
  attr_accessor :location
  
  def initialize(name, health, denarii, location)
    @name = name
    @health = health
    @denarii = denarii
    @location = location
  end
  
  def name?
    @name = gets.chomp.capitalize
>>>>>>> revised
  end
  
  def heal
    @healing = rand(11)
    @health = @health + @healing
  end
  
  def hurt
    @health = @health - @location.npc.strength
  end
  
  def infected
    @infected_hurting = rand(5)*5
    @health = @health - @infected_hurting
  end
  
  def rest
    @rest_healing = rand(5)*3
    @health = @health + @rest_healing
  end
  
  def gain
    @denarii = @denarii + @location.denarii
  end
  
  def spend
    @denarii = @denarii - @location.item.cost
<<<<<<< HEAD
=======
>>>>>>> master
>>>>>>> revised
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
  
  def infected
    @@wound = rand(6) * 5
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