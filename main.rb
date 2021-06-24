require_relative 'lib/board'
require_relative 'lib/game'
require_relative 'lib/render_board'
require_relative 'lib/pieces_files'
b = Board.start_chess

renderer = RenderBoard.new(b.grid)
puts renderer.render

