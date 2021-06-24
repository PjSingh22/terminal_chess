class Bishop < Piece

  def move_set
    [
      [1, 1],
      [1, -1],
      [-1, 1],
      [-1, -1]
    ].freeze
  end

  def symbol
    color == :white ? '♝' : '♗'
  end
end