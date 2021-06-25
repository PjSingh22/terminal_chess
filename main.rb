require_relative 'lib/board'
require_relative 'lib/game'
require_relative 'lib/render_board'
require_relative 'lib/pieces_files'
b = Board.new

b[[0, 0]] = Rook.new([0, 0], :black, b)
p b[[0, 0]].available_moves


# renderer = RenderBoard.new(b.grid)
# puts renderer.render

