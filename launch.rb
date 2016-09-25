require_relative 'game'
require_relative 'user_interface'

ui = UserInterface.new
game = Game.new ui
while game.game_over == false do
  game.loop
end
