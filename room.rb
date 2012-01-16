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
end
    