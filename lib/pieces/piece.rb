class Piece
  attr_accessor :position
  attr_reader :color, :board

  def initialize(position, color, board)
    @board = board
    @position = position
    @color = color
  end

  # available moves that don't move us into check.
  def safe_moves
    moves = []
    available_moves.each do |move|
      new_board = board.dup
      new_board.make_move(position, move)

      moves << move unless new_board.in_check?(color)
    end
    moves
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
