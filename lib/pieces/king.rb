class King < piece

  def move_set
    [
      [1, 1],
      [1, 0],
      [1, -1],
      [0, 1],
      [0, -1],
      [-1, 1],
      [-1, 0],
      [-1, -1]
    ].freeze
  end

  def symbol
    color == :white ? '♚' : '♔'
  end
end