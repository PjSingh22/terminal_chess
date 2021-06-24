class Knight < Piece

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

  def symbol
    color == :white ? '♞' : '♘'
  end
end