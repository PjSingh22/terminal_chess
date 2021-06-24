class Rook < Piece
  include Slideable
  
  def move_set
    [
      [0, 1],
      [0, -1],
      [1, 0],
      [-1, 0]
    ].freeze
  end

  def to_s
    color == :white ? '♜' : '♖'
  end
end