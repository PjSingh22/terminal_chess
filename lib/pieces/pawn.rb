class Pawn < Piece
  include Stepable
  
  def to_s
    color == :white ? '♟︎' : '♙'
  end
end