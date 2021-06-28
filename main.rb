require_relative 'lib/player'
require_relative 'lib/board'
require_relative 'lib/game'
require_relative 'lib/render_board'
require_relative 'lib/pieces_files'

b = Board.start_chess

# b[[0, 0]] = King.new([0, 0], :black, b)
# b[[6, 6]] = King.new([6, 6], :white, b)
# b[[3, 0]] = Rook.new([3, 0], :white, b)
# b[[3, 1]] = Rook.new([3, 1], :white, b)

puts b.checkmate?(:black)

# renderer = RenderBoard.new(b.grid)
# puts renderer.render

game = Game.new(b, Player.new(:white), Player.new(:black), RenderBoard)
game.play