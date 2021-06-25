class Knight < Piece
  include Stepable

  def move_set
    [
      [1, 2],
      [2, 1],
      [-1, -2],
      [-2, -1],
      [1, -2],
      [-1, 2],
      [2, -1],
      [-2, 1]
    ].freeze
  end

  def to_s
    color == :white ? '♞' : '♘'
  end
end