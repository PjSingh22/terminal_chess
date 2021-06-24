class Pawn < Piece

  def to_s
    color == :white ? '♟︎' : '♙'
  end
end