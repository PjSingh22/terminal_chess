require_relative 'lib/board'
require_relative 'lib/game'
require_relative 'lib/render_board'
require_relative 'lib/pieces_files'
b = Board.new

b.grid[0][0] = Pawn.new([0, 0], :white, b)
renderer = RenderBoard.new(b.grid)
puts renderer.render

