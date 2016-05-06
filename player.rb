require_relative 'board'

class Player
  attr_accessor :turn, :marker
  attr_reader :position

  def initialize(turn)
    @turn = turn
    if @turn == 1
      @marker = 'X'
    else
      @marker = 'O'
    end
    @position = 0
  end

  def get_input
    gets.to_i
  end

  def get_move
    check = false
    while check == false
      puts "Input position: "
      @position = get_input
      if @position > 0 && @position < 10
        check = true
      end
    end
  end

  def move(board)
    move = false
    while move == false do
      get_move
      move = board.place(@position, @marker)
    end
  end
end
