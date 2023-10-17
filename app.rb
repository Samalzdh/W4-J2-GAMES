require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("dipsy")
player2 = Player.new("Po")

puts "Bienvenu a l'examen des Chunins : "
puts player1.show_state
puts player2.show_state
i = 1
while player1.life_points >0 && player2.life_points >0 
  
  puts "Passons à la phase d'attaque :"
  puts 
  puts "ROUND #{i}"

  player1.attacks(player2)
  if player2.life_points <= 0 
    
    puts "victoire de #{player1.name}"
    puts 
    puts
  break

  else
    puts
    player2.attacks(player1)
    if player1.life_points <= 0 
      
      puts "victoire de #{player2.name}"
      break
    end
    puts 
    puts "--------------------------------------------------------"
  end
  i += 1 
end


