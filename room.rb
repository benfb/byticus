class Room
  attr_accessor :name, :n, :s, :e, :w, :npc, :denarii, :item
  def initialize(name, n, s, e, w, npc, denarii, item)
    @name = name
    @n = n
    @s = s
    @e = e
    @w = w
    @npc = npc
    @denarii = denarii
    @item = item
  end
  
  def look
    puts 'You are in ' + $player.location.name + '.'
    unless $player.location.npc.nil?
      puts 'There is a ' + $player.location.npc.name + ' in the room.'
    end
    unless $player.location.item.nil? 
      puts 'It contains a ' + $player.location.item.to_s + '.'
    end
  end
  
  def search
    if $player.location.denarii > 0
      $player.gain
      puts 'You find ' + $player.location.denarii.to_s + ' denarii in the room. You now have ' + $player.denarii.to_s + ' denarii.'
      $player.location.denarii = 0
    else
      puts 'There is no money in this room.'
    end
  end
  
  def go(n, s, e, w)
  end
  def n
    unless $player.location.n.nil? 
      $player.location = $player.location.n 
      puts 'You are now in ' + $player.location.name + '.'
    else
      puts 'You can\'t go that way.'
    end
  end
  
  def s
    unless $player.location.s == nil
      $player.location = $player.location.s 
      puts 'You are now in ' + $player.location.name + '.'
    end
    if $player.location.s == nil
      puts 'You can\'t go that way.'
    end
  end
  
  def e
    unless $player.location.e == nil
      $player.location = $player.location.e 
      puts 'You are now in ' + $player.location.name + '.'
    end
    if $player.location.e == nil
      puts 'You can\'t go that way.'
    end
  end
  
  def w
    unless $player.location.w == nil
      $player.location = $player.location.w 
      puts 'You are now in ' + $player.location.name + '.'
    end
    if $player.location.w == nil
      puts 'You can\'t go that way.'
    end
  end
  
end
    