require 'minitest/autorun'
require_relative "player"

describe "Player" do
  describe "initialize" do
    it "should create player to go first" do
      player = Player.new(1)
      assert_equal('X', player.marker)
      assert_equal(1, player.turn)
    end

    it "should create player to go second" do
      player = Player.new(2)
      assert_equal('O', player.marker)
      assert_equal(2, player.turn)
    end    
  end

  describe "test move" do
    before do
      class UserInterface
        def get_input
          5
        end
      end
    end

    it "should place the move" do
      player = Player.new(1)
      board = Board.new
      player.move(board)
      assert_equal('X', board.grid[5])
    end
  end
end