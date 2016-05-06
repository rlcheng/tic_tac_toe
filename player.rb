require_relative 'user_interface'
require_relative 'board'

class Player
  attr_accessor :turn, :marker
  attr_reader :position, :name

  def initialize(turn)
    @name = 'Player'
    @turn = turn
    if @turn == 1
      @marker = 'X'
    else
      @marker = 'O'
    end
    @position = 0
    @UI = UserInterface.new
  end

  def move(board)
    move = false
    while move == false do
      @position = @UI.get_move
      move = board.place(@position, @marker)
    end
  end
end
