class Queen < Piece
  include Slideable

  def move_set
    [
      [0, 1],
      [0, -1],
      [-1, 0],
      [1, 1],
      [1, -1],
      [-1, 1],
      [-1, -1]
    ]
  end

  def to_s
   color == :white ? '♛' : '♕'
  end
end