require 'minitest/autorun'
require_relative "user_interface"

def with_captured_stdout
  begin
    old_stdout = $stdout
    $stdout = StringIO.new('','w')
    yield
    $stdout.string
  ensure
    $stdout = old_stdout
  end
end

describe "UI" do
  before do
    @UI = UserInterface.new
    @board = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  describe "print board" do
    it "should print the grid" do
      output = with_captured_stdout { @UI.print_board(@board)}
      assert_equal(" 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9 \n", output)
    end
  end

  describe "message" do
    it "should output message" do
      output = with_captured_stdout {@UI.message("hello world!")}
      assert_equal("hello world!\n", output)
    end
  end

  describe "get choice" do
    before do
      class UserInterface
        def get_input
          1
        end
      end

      @UI = UserInterface.new
    end

    it "should get user choice to go first" do
      assert_equal(1, @UI.get_input)
    end
  end
  
end
