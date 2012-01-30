class Player  
  # Defines instance variables
  attr_reader :wound, :name, :health, :healing, :rest_healing, :infected_hurting, :denarii
  attr_accessor :location, :inv, :direction
  
  def initialize(name, health, denarii, location, inv)
    @name = name
    @health = health
    @denarii = denarii
    @location = location
    @inv = []
  end
  
  def name?
    @name = gets.chomp.capitalize
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
  end
  
  def go(direction)
    new_location = location.send(direction)

    if new_location
      location = new_location
      puts "You are now in #{location.name}."
      return true
    else
      puts "You can't go that way."
      return false
    end
  end
  
  # CHANGED: Added stats method to player
  def stats
    puts 'You have ' + self.health.to_s + ' health remaining and have ' + self.denarii.to_s + ' denarii to your name.'
  end
end