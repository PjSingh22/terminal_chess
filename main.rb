require_relative 'lib/board'
require_relative 'lib/game'
require_relative 'lib/render_board'
require_relative 'lib/pieces_files'
b = Board.new

b[[2, 2]] = King.new([2, 2], :black, b)
p b[[2, 2]].available_moves


# renderer = RenderBoard.new(b.grid)
# puts renderer.render

