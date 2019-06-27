
class ComputerPlayer
  attr_accessor :board
  attr_reader :mark

  def initialize(mark, board)
    @mark = mark
    @board = board
  end

  def display
    @board.print
  end

  def get_move
    available_pos = []
    @board.grid.each_with_index do |subarray, i|
      subarray.each_with_index do |ele, j|
        if ele.nil? 
          available_pos << [i,j]
        end
      end
    end

    available_pos.each do |pair|
      @board.place_mark(pair,@mark)
      if @board.winner == @mark
        @board[pair] = nil
        return pair
      else
        @board[pair] = nil
      end
    end

    available_pos.each do |pair|
      @board.place_mark(pair,:X)
      if @board.winner == :X
        @board[pair] = nil
        return pair
      else
        @board[pair] = nil
      end
    end

    available_pos.sample
  end

end