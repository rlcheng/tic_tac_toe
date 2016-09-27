require_relative 'user_interface'
require_relative 'board'
require_relative 'player'
require_relative 'cpu'

class Game
  attr_accessor :game_over
  attr_reader :player, :cpu, :current_player, :board

  def initialize (ui, player, cpu, current_player)
    @game_over = false

    @board = Board.new

    @UI = ui
    @player = player
    @cpu = cpu
    @current_player = current_player

    @UI.print_board(@board.grid)
    @UI.message("")
  end

  def next_turn
    if @current_player.name == "Player"
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
    @UI.message("#{@current_player.name} #{@current_player.marker} turn")
    @current_player.move(@board)
    check
    @UI.print_board(@board.grid)
    next_turn
  end
end
