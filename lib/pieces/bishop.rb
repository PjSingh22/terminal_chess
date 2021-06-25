class Bishop < Piece
  include Slideable

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