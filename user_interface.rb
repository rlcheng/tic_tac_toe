class UserInterface

  def display(board)
    output = ""
    (1..9).each do |position|
      output << " #{board[position] || position} "
      case position % 3
        when 1, 2 then output << "|"
        when 0 then output << "\n-----------\n" unless position == 9
      end
    end
    puts output
  end

end
