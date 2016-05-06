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

  def get_choice
    choice = 10
    while !choice.between?(1,2)
      puts "Enter 1 to go first or 2 to go second"
      choice = get_input
    end
    choice
  end

  def get_input
    gets.to_i
  end

end
