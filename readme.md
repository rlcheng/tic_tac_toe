##Tic Tac Toe Readme

###How to Run
1. This game is written using Ruby 2.3, please make sure that version is installed.
2. To run the game, `ruby game.rb`
3. To run any of the tests, run the files name *_test.rb. Example :`ruby board_test.rb`

###How to Play
1. First you choose if you want to go first or allow the AI to go first.
2. After that when it is your turn, you can choose which position to go on. Each position is labeled and if the position is taken, an X or O will appear instead of the position number.

###AI
I used Minimax to determine the best move for the AI to make. Score of 10 if a move results in eventually winning the game. 0 if it results in a draw, and -10 if it results in a loss. Depth of recursive calls on Minimax is also put into consideration of calculating the score so that the AI will choose the highest scoring move, meaning a move that has the least amount of resulting moves to a win, or draw.

###More stuff
This game is structured so that it can easily be adapted to allow 2 human players, or a game completely played out by 2 AIs, as can be seen in cpu_test.rb
