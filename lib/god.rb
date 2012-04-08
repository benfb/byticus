class God
  
  ### Defines variables

  def wait
    sleep 2
  end
  
  ### The basic method of the game
  
  def input
    print '>> '
    $input = gets.chomp.downcase
  end

  def help
    puts File.open("help.txt").read
  end
  
  ### The glorious check method
  
  def check
    case $input
      when 'inv'
        list
      when 'get'
        get
        add
      when 'n', 'north'
        $player.go(:n)
      when 's', 'south'
        $player.go(:s)
      when 'e', 'east'
        $player.go(:e)
      when 'w', 'west'
        $player.go(:w)
      when 'search'
        $player.location.search
      when 'buy'
        buy
      when 'l', 'look'
        $player.location.look
      when 'help'
        help
      when 'stats'
        $player.stats
      else puts 'That is not a valid command.'  
    end
  end
  
  def accept_command
    input
    check
  end

end