class Room
  attr_accessor :name, :n, :s, :e, :w, :npc, :denarii, :item, :direction
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
      puts 'There is a(n) ' + $player.location.npc.name + ' in the room.'
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
  
  
end
    