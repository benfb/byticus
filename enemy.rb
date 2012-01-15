class Enemy
  attr_accessor :name, :health, :strength
  def initialize(name, health, strength)
    @name = name
    @health = health
    @strength = strength
  end
end