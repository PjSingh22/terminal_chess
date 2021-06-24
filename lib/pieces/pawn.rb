class Pawn < Piece

  def symbol
    color == :white ? '♟︎' : '♙'
  end
end