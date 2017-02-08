Dir["**.rb"].each {|file| require_relative file }

class Game
  ACTIONS = [
    :north, :east, :south, :west, :look, :fight, :take, :status
  ]

  def initialize
    @world = World.new
    @player = Player.new

    start_game
  end

  private

  def start_game
    while @player.is_alive?
      @current_room = @world.get_room_of(@player)

      print_status

      action = take_player_input
      next unless ACTIONS.include? action

      take_action(action)
    end
  end

  def take_player_input
    print "What will do you? "
    gets.chomp.to_sym
  end

  def print_status
    puts "You are at map coordinates [#{@player.x_pos}, #{@player.y_pos}]"

    puts @current_room
    if @current_room.content
      puts "You see #{@current_room.content}"
    end
  end

  def take_action(action)
    case action
    when :look
      print_status
    when :north
      @world.move_north(@player)
    when :east
      @world.move_east(@player)
    when :south
      @world.move_south(@player)
    when :west
      @world.move_west(@player)
    when :fight, :take
      @current_room.interact(@player)
    when :status
      @player.player_status
    end
  end
end

Game.new
