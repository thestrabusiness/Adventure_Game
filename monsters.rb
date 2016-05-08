class Monster
  attr_accessor :HP, :STR

  MAX_HP = 10

  def initialize
    @HP   = MAX_HP
    @STR = 6
  end

  def is_alive?
    @HP > 0
  end

  def rcv_damage(amount)
    @HP -= amount
  end

  def to_s
    "a hideous, oozing beast!"
  end

  def interact(player)
    while player.is_alive?
      puts "You hit the monster for #{player.player_STR} points."
      rcv_damage(player.player_STR)
      break unless is_alive?
      player.rcv_damage(@STR)
      puts "The monster hits you for #{@STR} points."
    end
  end
end