require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("dipsy")
player2 = Player.new("Po")

puts "voici l'etat de chaque joueur : "
puts player1.show_state
puts player2.show_state
i = 1
while player1.life_points >0 && player2.life_points >0 
  
  puts "Passons à la phase d'attaque :"
  puts 
  puts "round #{i}"

  player1.attacks(player2)
  if player2.life_points == 0
    puts player2.show_state
    puts "victoire de #{player2.name}"
    puts 
    puts
  break
  else
    puts
    player2.attacks(player1)
    
    puts 
    puts "--------------------------------------------------------"
  end
  i += 1 
end


