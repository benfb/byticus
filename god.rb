class God  
  # Defines global variables
  $wait_time = 2
  
  $inv = []

  def wait
    sleep $wait_time
  end
  
  def input
    puts '>>'
    $input = gets.chomp.downcase
  end
  
  def add
    $inv.push($item)
  end
  
  def list
    puts $inv.each {|i| print}
  end
  
  def check
    if $input == 'inv'
      $inv.each {|i| print}
    end
  end

end