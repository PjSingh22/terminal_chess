require_relative 'lib/board'
require_relative 'lib/game'
require_relative 'lib/render_board'
require_relative 'lib/pieces_files'
b = Board.start_chess

renderer = RenderBoard.new(b)


b[[2, 2]] = Pawn.new([2, 2], :white, b)
b[[2, 0]]= Pawn.new([2, 2], :white, b)
b.move_piece([1, 1], [4, 4])
renderer.render



# renderer = RenderBoard.new(b.grid)
# puts renderer.render

