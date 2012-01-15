class God
  
  # Defines global variables

  @@wait_time = 2
  
  @@inv = []
  $commands = ['help', 'n', 's', 'e', 'w', 'attack']

  def wait
    sleep @@wait_time
  end
  
  def input
    puts '>>'
    $input = gets.chomp.downcase
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
  
  def n
    unless $player.location.n == nil
      $player.location = $player.location.n 
      puts 'You are now in ' + $player.location.name + '.'
    end
    if $player.location.n == nil
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
  
  def search
    if $player.location.denarii > 0
      $player.gain
      puts 'You find ' + $player.location.denarii.to_s + ' denarii in the room. You now have ' + $player.denarii.to_s + ' denarii.'
      $player.location.denarii = 0
    else
      puts 'There is no money in this room.'
    end
  end
  
  def check
    case $input
      when 'inv'
        list
      when 'get'
        get
        add
      when 'n'
        n
      when 's'
        s
      when 'e'
        e
      when 'w'
        w
      when 'search'
        search
      when 'buy'
        buy
      else puts 'That is not a valid command.'  
    end
  end
end