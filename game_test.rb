require 'minitest/autorun'
require_relative 'game'

describe "Game" do
  before do
    class UserInterface
      def get_input
        1
      end
    end

    @game = Game.new
  end

  describe "initialize" do
    it "should create player who goes first" do
      assert_equal('X', @game.player.marker)
      assert_equal(1, @game.player.turn)
    end

    it "should create cpu who goes second" do
      assert_equal('O', @game.cpu.marker)
      assert_equal(2, @game.cpu.turn)
    end

    it "should create a blank board" do
      (1..9).each do |position|
        assert_equal(nil, @game.board.grid[position])
      end
    end
  end

  describe "test next_turn" do
    it "should cycle turns" do
      assert_equal(2, @game.next_turn)
      assert_equal(1, @game.next_turn)
      assert_equal(2, @game.next_turn)
    end
  end

  describe "test check winner" do
    it "should determine human player as winner" do
      @game.board.place(1,'X')
      @game.board.place(2,'X')
      @game.board.place(3,'X')
      @game.check
      assert_equal('X', @game.board.winner)
      assert_equal(true, @game.game_over)
    end

    it "should determine cpu player as winner" do
      @game.board.place(1,'O')
      @game.board.place(2,'O')
      @game.board.place(3,'O')
      @game.check
      assert_equal('O', @game.board.winner)
      assert_equal(true, @game.game_over)
    end

    it "should determine game is a draw" do
      @game.board.place(1,'X')
      @game.board.place(2,'O')
      @game.board.place(3,'X')
      @game.board.place(4,'O')
      @game.board.place(5,'O')
      @game.board.place(6,'X')
      @game.board.place(7,'X')
      @game.board.place(8,'X')
      @game.board.place(9,'O')
      @game.check
      assert_equal(true, @game.board.draw?)
      assert_equal(true, @game.game_over)
    end
  end

  describe "test game loop" do
    it "should go through a turn" do
      @game.next_turn
      @game.loop
      assert_equal(1, @game.turn)
    end
  end
end
