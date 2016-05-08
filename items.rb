class Item
  attr_reader :name  
  
  def interact(player)
    puts "You picked up #{self}"

    perform_item_effect(player)
  end

  def to_s
    "a shining #{@name}!"
  end
end

class Potion < Item
  def initialize
    @name = "potion"
  end

  def perform_item_effect(player)
    player.heal(10)
  end
end

class Sword < Item 
  def initialize
    @name = "sword"
  end

  def perform_item_effect(player)
    player.player_STR += 1
  end
end

class Armor < Item
  def initialize
    @name = "armor"
  end
  
  def interact
    puts "You picked up a set of #{self}"
    
    perform_item_effect(player)
  end
  
  def to_s
    "a shiny set of #{@name}"
  end
    
  def perform_item_effect(player)
    player.player_DEF += 1
  end
end
