class Player  
  # Defines global variables
  $health = 100
  
  def name?
    $name = gets.chomp.capitalize
  end
  
  def wait
    sleep $wait_time
  end
end