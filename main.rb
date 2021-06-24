require_relative 'lib/board'
require_relative 'lib/game'
require_relative 'lib/render_board'
require_relative 'lib/pieces_files'
b = Board.new

b[[0, 0]] = Pawn.new([0, 0], :black, b)
b[[0, 1]] = Pawn.new([0, 1], :white, b)
piece = b[[0, 0]]

p piece.enemy?([0, 1])

# renderer = RenderBoard.new(b.grid)
# puts renderer.render

