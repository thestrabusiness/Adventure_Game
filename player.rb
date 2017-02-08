class Player
  attr_accessor :player_HP, :player_STR
  attr_accessor :x_pos, :y_pos

  MAX_HP = 100

  def initialize
    @player_HP = 100
    @player_STR = 5
    @player_DEF = 1
    @inventory = []
    @x_pos = 0
    @y_pos = 0
  end

  def player_status
    puts "You have #{@player_HP} HP remaining"
    puts "Your strength is #{@player_STR}"
    puts "Your defense is #{@player_DEF}"
  end

  def is_alive?
    @player_HP > 0
  end

  def rcv_damage(amount)
    @player_HP -= amount
    kill if @player_HP < 1
  end

  def heal(amount)
    @player_HP += amount
    @player_HP = [@player_HP, MAX_HP].min
  end

  def kill
    puts "You have died!"
    exit
  end
end
