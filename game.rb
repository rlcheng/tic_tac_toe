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

    choice = get_choice
    @player = Player.new(choice)
    puts "You are Player #{@player.marker}"

    if choice == 1
      @cpu = Cpu.new(2)
    else
      @cpu = Cpu.new(1)
    end
    puts "CPU is Player #{@cpu.marker}"

    @board.display
    puts ""
  end

  def get_choice
    choice = 0
    check = false
    while check == false
      puts "Enter 1 to go first or 2 to go second"
      choice = get_input
      if choice == 1
        check = true
      elsif choice == 2
        check = true
      end
    end
    choice
  end

  def get_input
    gets.to_i
  end

  def next_turn
    if @turn == 1
      @turn = 2
    else
      @turn = 1
    end
  end

  def check
    winner = @board.winner
    if winner
      if winner == @player.marker
        puts "You win!!!"
      else
        puts "You lose! CPU wins!!!"
      end
      @game_over = true
    elsif @board.draw?
      puts "It's a Draw!"
      @game_over = true
    end
  end

  def loop
    if @turn == @player.turn
      puts "Player #{@player.marker} turn"
      @player.move(@board)
    else
      puts "CPU #{@cpu.marker} turn"
      @cpu.move(@board)
    end
    check
    @board.display
    puts ""
    next_turn
  end
end

if __FILE__ == $0
  game = Game.new
  while game.game_over == false do
    game.loop
  end
end  
