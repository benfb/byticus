class Room
  attr_accessor :name, :n, :s, :e, :w, :npc, :denarii
  def initialize(name, n, s, e, w, npc, denarii)
    @name = name
    @n = n
    @s = s
    @e = e
    @w = w
    @npc = npc
    @denarii = denarii
  end
end
    