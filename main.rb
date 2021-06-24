require_relative 'lib/board'
require_relative 'lib/game'
require_relative 'lib/render_board'

b = Board.new

renderer = RenderBoard.new(b)
renderer.display
