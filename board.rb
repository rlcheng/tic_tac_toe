class Board
  attr_reader :grid, :blanks
  def initialize
    @grid = Array.new(10)
    @blanks = 9
    @win = [[1,2,3],[4,5,6],[7,8,9], # horizontal lines
            [1,4,7],[2,5,8],[3,6,9], # vertical lines
            [1,5,9],[3,5,7]] #diagonal lines    
  end

  def place(position, mark)
    if @grid[position] == nil
      @grid[position] = mark
      @blanks -= 1
      return true
    end
    puts "Position taken, please select another."
    false
  end

  def full?
    return false if @blanks != 0
    true
  end

  def win?(marker)
    @win.any? do |line|
      line.all? {|position| @grid[position] == marker}
    end
  end

  def winner
    return 'X' if win?('X')
    return 'O' if win?('O')
    nil
  end

  def draw?
    full? && winner.nil?
  end 

  def available_positions
    positions = []
    (1..9).each do |position|
      positions.push position if @grid[position].nil?
    end
    positions
  end

  def reset(position)
    @grid[position] = nil
    @blanks += 1
  end

  def next_mark
    if @blanks.odd?
      return 'X'
    else
      return 'O'
    end
  end
end
