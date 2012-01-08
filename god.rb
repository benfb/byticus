class God  
  # Defines global variables
  @wait_time = 2
  
  $inv = []
  $commands = ['help', 'n', 's', 'e', 'w', 'attack']

  def wait
    sleep 2
  end
  
  def input
    puts '>>'
    $input = gets.chomp.downcase
  end
  
  def add
    $inv.push($item)
  end
  
  def list
    puts $inv.each {|i| print}.to_s.reverse unless $inv.empty?
    if $inv.empty?
      puts 'You are carrying nothing. Whimp.'
    end
  end
  
  def check
    if $input == 'inv'
      list
    elsif $input == 'get'
      puts 'What do you want to get?'
      $item = gets.chomp.downcase
      add
    end
  end
end