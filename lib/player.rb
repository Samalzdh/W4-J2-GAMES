class Player

  attr_accessor :name, :life_points
  def initialize(name_u)
    @name = name_u.to_s
    @life_points = 10
  end
  def show_state
    puts "#{@name} a #{@life_points} points de vie"
  end

  def gets_damage(damage)
    @life_points -= damage
    if @life_points <= 0
      puts "Le joueur #{@name} a été tué"
    else 
      show_state
    end
  end

  def attacks (player2)
    puts "le joueur #{self.name} attaque le joueur #{player2.name}"
    attack =  compute_damage
    puts "*il lui inflige #{attack} points de dégâts"
    player2.gets_damage(attack)
  end

  def compute_damage
    return rand(1..6)
  end

  
end
