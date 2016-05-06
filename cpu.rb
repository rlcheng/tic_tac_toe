require_relative "player"

class Cpu < Player
  attr_accessor :moves
  attr_reader :opponent, :name

  GAME_NOT_OVER = 999

  def initialize(turn)
    super
    @name = 'CPU'
    if @turn == 1
      @opponent = 'O'
    else
      @opponent = 'X'
    end
  end

  def move(board)
    minimax(board, 0)
    board.place(@position, @marker)
  end

  def score(board, depth)
    if board.win?(@marker)
      return 10 - depth
    elsif board.win?(@opponent)
      return depth - 10
    elsif board.blanks == 0
      return 0
    end
    GAME_NOT_OVER
  end

  def minimax(board, depth)
    score = score(board, depth)
    return score if score != GAME_NOT_OVER
    depth += 1
    scores = []
    positions = []

    board.available_positions.each do |position|
      board.place(position, board.next_mark)
      scores.push minimax(board, depth)
      positions.push position
      board.reset(position)
    end

    if board.next_mark == @marker
      max_score_index = scores.each_with_index.max[1]
      @position = positions[max_score_index]
      return scores[max_score_index]
    else
      min_score_index = scores.each_with_index.min[1]
      @position = positions[min_score_index]
      return scores[min_score_index]
    end
  end
end