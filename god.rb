class God
  
  ### Defines variables ###

  @@wait_time = 2
  
  @@inv = []

  def wait
    sleep @@wait_time
  end
  
  ### The basic method of the game ###
  
  def input
    puts '>>'
    $input = gets.chomp.downcase
  end
  
  ### Directional commands ###
  
  def n
    unless $player.location.n == nil
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
  
  ### Item commands ###
  
  def search
    if $player.location.denarii > 0
      $player.gain
      puts 'You find ' + $player.location.denarii.to_s + ' denarii in the room. You now have ' + $player.denarii.to_s + ' denarii.'
      $player.location.denarii = 0
    else
      puts 'There is no money in this room.'
    end
  end
  
  def add
    @@inv.push($item)
  end
  
  def list
    puts @@inv.each {|i|} unless @@inv.empty?
    if @@inv.empty?
      puts 'You are carrying nothing. Whimp!'
    end
  end
  
  def get
    puts 'What do you want to get?'
    $item = gets.chomp.downcase
    add
  end
  
  ### Description, help and info commands ###
  
  def look
    puts 'You are in ' + $player.location.name + '. There is a ' + $player.location.npc.name + ' in the room as well.'
  end
  
  def help
    puts File.open("help.txt").read
  end
  
  def info
    puts File.open("readme.md").read
  end
  
  ### The glorious check method ###
  
  def check
    case $input
      when 'inv'
        list
      when 'get'
        get
        add
      when 'n', 'north'
        n
      when 's', 'south'
        s
      when 'e', 'east'
        e
      when 'w', 'west'
        w
      when 'search'
        search
      when 'buy'
        buy
      when 'l', 'look'
        look
      when 'help'
        help
      when 'info'
        info
      else puts 'That is not a valid command.'  
    end
  end
end