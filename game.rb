require_relative 'user_interface'
require_relative 'board'
require_relative 'player'
require_relative 'cpu'

class Game
  attr_accessor :game_over, :turn
  attr_reader :player, :cpu, :board

  def initialize
    @game_over = false
    @turn = 1

    @board = Board.new

    @UI = UserInterface.new

    choice = @UI.get_choice
    @player = Player.new(choice)
    @UI.message("You are Player #{@player.marker}")

    if choice == 1
      @cpu = Cpu.new(2)
      @current_player = @player
    else
      @cpu = Cpu.new(1)
      @current_player = @cpu
    end
    @UI.message("CPU is Player #{@cpu.marker}")

    @UI.print_board(@board.grid)
    puts ""
  end

  def next_turn
    if @current_player.turn == 1
      @current_player = @cpu
    else
      @current_player = @player
    end
  end

  def check
    winner = @board.winner
    if winner
      if winner == @player.marker
        @UI.message("You win!!!")
      else
        @UI.message("You lose! CPU wins!!!")
      end
      @game_over = true
    elsif @board.draw?
      @UI.message("It's a Draw!")
      @game_over = true
    end
  end

  def loop
=begin
    if @turn == @player.turn
      @UI.message("Player #{@player.marker} turn")
      @player.move(@board)
    else
      @UI.message("CPU #{@cpu.marker} turn")
      @cpu.move(@board)
    end
=end
    puts "#{@current_player.name} #{@current_player.marker} turn"
    @current_player.move(@board)
    check
    @UI.print_board(@board.grid)
    next_turn
  end
end

if __FILE__ == $0
  game = Game.new
  while game.game_over == false do
    game.loop
  end
end  
