require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "--------------------------------------------------------------"
puts "|                BIENVENUE DANS LE RFC                       |"
puts "|                                                            |"
puts "| Tout les coups sont permis pour repartir avec la victoire !|"
puts "--------------------------------------------------------------"
puts
puts "Qui vient defier le SFC?"
print "> "

user = gets.chomp
player_human = HumanPlayer.new(user)
player2 = Player.new("Axel le sommnolant")
player3 = Player.new("Floriane the snipe queen")
player4 = Player.new("Nelly presque furtado")
player5 = Player.new("Alex et Nino")
enemmies = [player2, player3, player4, player5]
enemy1 = enemmies.sample
enemy2 = enemmies.sample
vilains = [enemy1, enemy2]

puts
puts "tes adversaires du jours sont : {#{enemy1.name}, #{enemy2.name}}"
puts 
puts 
puts "--------------------------------------------------------------"
puts "|                Terrasse tes enemmies                       |"
puts "|         pour te hisser au sommet de la gloire              |"
puts "|              et affronter le terrible Dipsy                |"
puts "--------------------------------------------------------------"
puts 

while player_human.life_points > 0 && (enemy1.life_points > 0 || enemy2.life_points > 0)
  puts "Le challenger a #{player_human.life_points} hp"
  puts
  puts "QUELLE ACTIONS VEUX TU EFFECTUER ?"
  puts
  puts "a - chercher une meilleure arme"
  puts "s - se soigner"
  puts 
  puts " ---- Attaquer un enemi ---- "
  puts
  puts "0 - #{enemy1.name} a #{enemy1.life_points} hp"
  puts "1 - #{enemy2.name} a #{enemy2.life_points} hp"
  print "> "
  choice = gets.chomp
  puts
  case choice
  when "a"
    player_human.seach_weapon
    puts 
   puts player_human.show_state 
  when "s"
    player_human.search_health_pack
    puts 
    puts player_human.show_state 
  when "0"
    player_human.attacks(enemy1)
    if enemy1.life_points <= 0
      puts "#{enemy1.name} a perdu mais il reste #{enemy2.name}"
    else
      puts enemy1.attacks(player_human)
      puts enemy2.attacks(player_human)
    end
    puts 
    puts player_human.show_state  
  when "1"
    player_human.attacks(enemy2)
    if enemy2.life_points <= 0
      puts "#{enemy2.name} a perdu mais il reste #{enemy1.name}"
    else
      puts enemy1.attacks(player_human)
      puts enemy2.attacks(player_human)
    end
   puts 
   puts player_human.show_state 
  end
  puts "--------------------------------------------------------------"
end