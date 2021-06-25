class Piece
  attr_accessor :position
  attr_reader :color, :board

  def initialize(position, color, board)
    @board = board
    @position = position
    @color = color
  end

  def enemy?(position)
    !board[position].nil? && board[position].color != color
  end

  def current_r
    position.first
  end

  def current_c
    position.last
  end
end
