require_relative 'board'

class UserInterface

  def print_board(board)
    output = ""
    (1..9).each do |position|
      output << " #{board[position] || position} "
      case position % 3
        when 1, 2 then output << "|"
        when 0 then output << "\n-----------\n" unless position == 9
      end
    end
    output << "\n"
    puts output
  end

  def message(output)
    puts output
  end

  def get_input
    gets.to_i
  end

  def get_allowed_input(min, max, message)
    input = 999
    while !input.between?(min, max)
      puts "#{message}: "
      input = get_input
    end
    input
  end

  def get_choice
    get_allowed_input(1, 2, "Enter 1 to go first or 2 to go second")
  end

  def get_move
    get_allowed_input(1, Board.max_position, "Input position: ")
  end

end
