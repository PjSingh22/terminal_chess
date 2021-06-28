require_relative 'lib/board'
require_relative 'lib/game'
require_relative 'lib/render_board'
require_relative 'lib/pieces_files'
b = Board.new

renderer = RenderBoard.new(b)


b[[1, 1]] = King.new([1, 1], :black, b)
b[[1, 2]] = Queen.new([1, 2], :white, b)
b[[6, 6]] = King.new([6, 6], :white, b)
puts b.in_check?(:black)
puts b.in_check?(:white)


# renderer = RenderBoard.new(b.grid)
# puts renderer.render

