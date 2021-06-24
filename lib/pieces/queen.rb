class Queen < Piece
  
  def move_dirs
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

  def symbol
   color == :black ? '♛' : '♕'
  end
end