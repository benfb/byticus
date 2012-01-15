$: << File.expand_path(File.dirname(__FILE__))  

require 'rubygems'
require 'god'
require 'actor'
require 'player'
require 'room'
require 'enemy'

@god = God.new()

# Creates the rooms
@old_lady = Enemy.new('Old Lady', 5, rand(11))
@goblin = Enemy.new('Goblin', 5, rand(11))
@wall = Room.new('Wall', nil, @dark_hallway, nil, nil, @goblin, 0)
@dark_hallway = Room.new('Dark Hallway', @wall, nil, nil, nil, @old_lady, 5)

puts 'Welcome to B Y T I C U S !'
puts 'What be your name, oh great adventurer?'

$player = Player.new('Ben', 100, 5, @dark_hallway)
puts 'Greetings, ' + $player.name + '!'
puts 'You have ' + $player.denarii.to_s + ' denarii and ' + $player.health.to_s + ' health.'
@god.wait
puts 'The game will now begin!'
puts ''
@god.wait
puts 'You\'re walking down a ' + @dark_hallway.name + '. There is an ' + @dark_hallway.npc.name.to_s + ' in the room. If you go to the north, you will climb a ' + @dark_hallway.n.name.to_s + '. You decide to talk to her. You say:'

@god.input
@god.check

$player.hurt

puts 'The lady gets angry and kicks your shins. You lose ' + $player.wound.to_s + ' health!'

puts 'You now have ' + $player.health.to_s + ' health remaining.'
puts ''
@god.wait
puts 'Ouch, you say. Type in fight to attack the lady!'

@god.input
@god.check

until $input == 'fight'
	puts 'Time is money! Type in fight to attack'
	@god.input
  @god.check
end

if $input == 'fight'
	puts 'You attack. The poor lady flees in terror.'
end

$player.location = @wall

puts 'You see a wall. It looks like you can climb it. It may be a shortcut. There is a ' + $player.location.npc.name.to_s + ' in the room.'
@god.wait
puts 'There is also a pathway to the north.'
@god.wait
puts 'After a moment\'s hesitation, you decide to try the wall. Type in climb to scale the wall.'	

@god.input
@god.check

until $input == 'climb'
  puts 'Type in climb to climb theë wall.' 
	@god.input
  @god.check
end

@chance = rand(6)/5

if $input == 'climb' and @chance <= 0.8
	$player.hurt
	puts 'You try to climb the wall, but it is too slippery. you fall and lose ' + $player.wound.to_s + ' health!'
  @god.wait
	puts 'You now have ' + $player.health.to_s + ' health remaining.'
  @god.wait
	puts 'After your fall, you decide to either walk along the path or try to climb it again.'
else
  puts 'You\'ve won a million dollars!'
end

$player.heal

until $input == 'walk north'
  puts 'Type in walk north to walk along the path.' 
  @god.input
  @god.check
end  

if $input == 'walk north'
	puts 'You walk along the path. You then come into a clearing, and see a lake. You wash yourself in it. It restores ' + $player.healing.to_s + ' health!'
	@god.wait
  puts 'You now have ' + $player.health.to_s + ' health!'
end
@god.wait
puts 'Suddenly, you hear footsteps and a low growl. Do you want to [flee], or [attack]?'

@god.input
@god.check

if $input == 'flee'
  $player.infected
  puts 'While attempting to flee your leg gets bitten by an infected dog. You lose ' + $player.infected_hurting.to_s + ' health over the next five minutes and have to rest!'
  sleep 10
  puts 'You awaken with ' + $player.health.to_s + ' health remaining.'
end

if $input == 'attack'
  $player.rest
  puts 'You shoot an arrow towards the noise, killing a beast. You skin the beast and eat the meat, restoring ' + $player.rest_healing.to_s + ' health.'
  $item = 'meat'
  @god.add
  puts 'You now have ' + $player.health.to_s + ' health remaining.'
  @god.list
  @god.input
  @god.check
end

puts 'Goodbye!'