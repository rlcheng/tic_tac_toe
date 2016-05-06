require 'minitest/autorun'
require_relative "cpu"

describe "Cpu" do
  describe "initialize" do
    it "should create cpu to go first" do
      cpu = Cpu.new(1)
      assert_equal('X', cpu.marker)
      assert_equal(1, cpu.turn)
    end

    it "should create cpu to go second" do
      cpu = Cpu.new(2)
      assert_equal('O', cpu.marker)
      assert_equal(2, cpu.turn)
    end
  end

  describe "test move" do
    it "should get AI to come up with a move and place it" do
      cpu = Cpu.new(1)
      board = Board.new
      cpu.move(board)
      assert_equal('X', board.grid[cpu.position])
    end
  end

  describe "test AI" do
    before do
      @cpu = Cpu.new(1)
      @board = Board.new
    end

    it "should place its first move in a corner" do
    # If you look at wikipedia's writeup on Tic Tac Toe (strategy section)
    # best strategy for the first person to start is one of the corners, the
    # cpu should make that choice.
      @cpu.minimax(@board, 0)
      assert_includes([1, 3, 7, 9], @cpu.position)
    end

    it "should place move in the center if cpu goes second" do
    # Same with person going second, best strategy should be in the middle,
    # the cpu should make that choice.
      @cpu = Cpu.new(2)
      @board.place(1, 'X')
      @cpu.minimax(@board, 0)
      assert_equal(5, @cpu.position)
    end

    it "should try to win as fast as possible" do
    # When the human player makes questionable moves, cpu will try to
    # capitalize and win. Note cpu doesn't try to block player by going to 4
    # and drag on the game.
      @cpu.move(@board)
      @board.place(5, 'O')
      @cpu.move(@board)
      @board.place(6, 'O')
      @cpu.move(@board)
      assert_equal('X', @board.winner)
    end

    it "should fight to the end and draw the game" do
    # When cpu plays agains cpu, no one should win
      @cpu2 = Cpu.new(2)
      @cpu.move(@board)
      @cpu2.move(@board)
      @cpu.move(@board)
      @cpu2.move(@board)
      @cpu.move(@board)
      @cpu2.move(@board)
      @cpu.move(@board)
      @cpu2.move(@board)
      @cpu.move(@board)
      assert_equal(true, @board.draw?)
    end

    it "should win if player makes the wrong move" do
      @cpu.move(@board)
      @board.place(6, 'O') # player makes the wrong first move
      @cpu.move(@board)
      @board.place(7, 'O')
      @cpu.move(@board)
      # Now player can't win because CPU can win by going on position 1 or 2
      @board.place(1, 'O') # player chooses position 1 so cpu should go position 2
      @cpu.move(@board)
      assert_equal('X', @board.grid[2])
      assert_equal('X', @board.winner)
      # Cpu wins
      @board.display
    end
  end
end
