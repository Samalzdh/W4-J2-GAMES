class Player

  attr_accessor :name, :life_points 

  def initialize(name_u, life_points = 10)
    @name = name_u
    @life_points = life_points
  end
  def show_state
    puts "#{@name} a #{@life_points} points de vie"
  end

  def gets_damage(damage)
    @life_points -= damage
    if @life_points <= 0
      puts "Le joueur #{@name} a été tué"
    else 
      
    end
  end

  def attacks (player)
    puts "#{self.name} attaque #{player.name}"
    attack =  compute_damage
    puts "il lui inflige #{attack} points de dégâts"
    player.gets_damage(attack)
    
  end

  def compute_damage
    return rand(1..6)
  end

 
end

class HumanPlayer < Player
  attr_accessor :weapon_level
  
  def initialize(name_u,life_points = 100, weapon_level = 1)
    @weapon_level = weapon_level
    super(name, life_points)
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie une arme de niveau #{@weapon_level}"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def seach_weapon
    weapon_level_new = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{weapon_level_new}"
    if weapon_level_new > @weapon_level 
       @weapon_level = weapon_level_new
      puts "BING BONG ! elle est meilleure que ton arme actuelle : tu la prends."
      
    else puts "AHHHH ! Seigneur ! POURQUOI ???!"
    end
  end
  def search_health_pack
    health_pack = rand(1..6)
    case health_pack
      when 1 then puts "Tu repars comme t'es arrivé : avec ta bite et ton couteau, bonne chance"
      when 2..5 
        if @life_points + 50 >= 100
          @life_points = 100
        else 
          life_points = @life_points + 50
        end
        puts "Tu reprend 50 puntos de vie, comme dirait Mbappe, Ah LA on est bien"  
      when 6 
        if @life_points + 80 >= 100
          @life_points = 100
        else 
          life_points = @life_points + 80
        end
        puts "T'es arrivé fumé comme un saumon, tu repars frais comme un gardon, enjoy"
    end
    
  end



end