require_relative 'game'
require_relative 'user_interface'

def select_order
  choice = @UI.get_choice
  @player = Player.new(choice, @UI)
  @UI.message("You are Player #{@player.marker}")

  if choice == 1
    @cpu = Cpu.new(2)
    @current_player = @player
  else
    @cpu = Cpu.new(1)
    @current_player = @cpu
  end
  @UI.message("CPU is Player #{@cpu.marker}")

  
end

def init
  @UI = UserInterface.new

  select_order

  @game = Game.new(@UI, @player, @cpu, @current_player)
end

def launch
  while @game.game_over == false do
    @game.loop
  end
end

init
launch
