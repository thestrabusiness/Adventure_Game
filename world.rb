class World
  WORLD_WIDTH  = 10
  WORLD_HEIGHT = 10

  def initialize
    @rooms = Array.new(WORLD_HEIGHT, Array.new(WORLD_WIDTH)) #create a WORLD_HIGHT*WORLD_WIDTH 2d array to represent world
  end

  def move_north(player)
    player.y_pos -= 1 if player.y_pos > 0 else puts "You can't go that way"
  end

  def move_south(player)
    player.y_pos += 1 if player.y_pos < WORLD_HEIGHT - 1 else puts "You can't go that way"
  end

  def move_east(player)
    player.x_pos += 1 if player.x_pos < WORLD_WIDTH - 1 else puts "You can't go that way"
  end

  def move_west(player)
    player.x_pos -= 1 if player.x_pos > 0 else puts "You can't go that way"
  end

  def get_room_of(player)
    @rooms[player.x_pos][player.y_pos] ||= Room.new #access existing room at player's X,Y coordinates or create new one if it doesn't exist yet.
  end
end

class Room
  attr_accessor :size, :content

  def initialize
    @content   = set_room_content
    @size      = set_room_size
    @adjective = describe
  end

  def interact(player)
    if @content
      @content.interact(player)
      @content = nil
    end
  end

  def to_s
    "You are in a #{@size} room. It is #{@adjective}."
  end

  private
  def set_room_content
    [Monster, Sword, Potion, Armor].sample(random: Random.new).new
  end

  def set_room_size
    ["small", "medium", "large", "square", "long", "tall", "circular"].sample(random: Random.new)
  end

  def describe
    ["dark", "dank", "creepy", "smelly", "moldy", "sexy" ].sample(random: Random.new)
  end
end