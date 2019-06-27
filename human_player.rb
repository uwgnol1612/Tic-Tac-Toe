
class HumanPlayer

  attr_reader :mark

  def initialize(mark, board)
    @mark = mark
    @board = board
  end

  def display
    @board.print
  end

  def get_move
    puts 'Please give two numbers (0-2) seperated by a space, ex. 1 2'
    move = gets.chomp.split(" ").map(&:to_i)
  end

end