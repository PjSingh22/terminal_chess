class Bishop < Piece

  def move_set
    [
      [1, 1],
      [1, -1],
      [-1, 1],
      [-1, -1]
    ].freeze
  end

  def to_s
    color == :white ? '♝' : '♗'
  end
end