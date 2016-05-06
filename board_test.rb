require 'minitest/autorun'
require_relative "board"

describe "Board" do
  before do
    @board = Board.new
  end

  describe "initialize" do
    it "should create blank grid" do
      (1..9).each do |position|
        assert_equal(nil, @board.grid[position])
      end
    end

    it "should set blanks variable to 9" do
      assert_equal(9, @board.blanks)
    end
  end
  
  describe "test place move" do  
    it "should place a move" do
      assert_equal(true, @board.place(1, 'X'))
    end

    it "cannot place a move when position is taken" do
      assert_equal(true, @board.place(1, 'X'))
      assert_equal(false, @board.place(1, 'O'))
    end


  end

  describe "test full?" do
    it "should see board not full" do
      assert_equal(true, @board.place(1, 'X'))
      assert_equal(8, @board.blanks)
      assert_equal(false, @board.full?)
    end

    it "should see board full" do
      @board.place(1, 'X')
      @board.place(2, 'O')
      @board.place(3, 'X')
      @board.place(4, 'O')
      @board.place(5, 'O')
      @board.place(6, 'X')
      @board.place(7, 'X')
      @board.place(8, 'X')
      @board.place(9, 'O')
      assert_equal(true, @board.full?)
    end
  end

  describe "test win" do
    it "should see X win" do
      @board.place(1, 'X')
      @board.place(2, 'X')
      @board.place(3, 'X')
      assert_equal(true, @board.win?('X'))
      assert_equal('X', @board.winner)
    end

    it "should see O win" do
      @board.place(4, 'O')
      @board.place(5, 'O')
      @board.place(6, 'O')
      assert_equal(true, @board.win?('O'))
      assert_equal('O', @board.winner)
    end

    it "should see no winner" do
      assert_equal(nil, @board.winner)
    end
  end

  describe "test draw" do
    it "should see game is a draw as there is no winner and board is full" do
      @board.place(1, 'X')
      @board.place(2, 'O')
      @board.place(3, 'X')
      @board.place(4, 'O')
      @board.place(5, 'O')
      @board.place(6, 'X')
      @board.place(7, 'X')
      @board.place(8, 'X')
      @board.place(9, 'O')
      assert_equal(true, @board.draw?)
    end
  end

  describe "test available positions" do
    it "should return array of available positions on the board" do
      assert_equal([1, 2, 3, 4, 5, 6, 7, 8, 9], @board.available_positions)
      @board.place(1, 'X')
      @board.place(2, 'O')
      @board.place(3, 'X')
      assert_equal([4, 5, 6, 7, 8, 9], @board.available_positions)
    end
  end

  describe "test reset" do
    it "should erase marker at given position and reset blanks counter" do
      @board.place(1, 'X')
      @board.place(9, 'O')
      @board.reset(1)
      assert_equal(nil, @board.grid[1])
      assert_equal(8, @board.blanks)
    end
  end

  describe "test next mark" do
    it "should tell which marker goes next" do
      # X goes first and only on odd number turns
      assert_equal('X', @board.next_mark)

      # O goes second and only on even number turns
      assert_equal(true, @board.place(1, 'X'))
      assert_equal('O', @board.next_mark)
    end
  end
end