require_relative 'lib/player'
require_relative 'lib/board'
require_relative 'lib/game'
require_relative 'lib/render_board'
require_relative 'lib/pieces_files'

# add serialization
# add tests for important parts
board_instance = Board.new
# BONUS:
# add ability to cancel move
# add playing against cpu
b = Board.start_chess

saved_data = board_instance.load_game
data_hash = saved_data[:board].grid

board_instance.grid = Array.new(data_hash)

# b[[0, 0]] = King.new([0, 0], :black, b)
# b[[6, 6]] = King.new([6, 6], :white, b)
# b[[3, 0]] = Rook.new([3, 0], :white, b)
# b[[3, 1]] = Rook.new([3, 1], :white, b)

# renderer = RenderBoard.new(b.grid)
# puts renderer.render

# put options to play a new game, or load a saved game here.
# game = Game.new(board_instance, Player.new(:white), Player.new(:black), RenderBoard)
# game.play


# arr = Array.new(data_hash)
# puts arr

def select_game
  puts 'Press 1 to make a new game.'
  puts 'Press 2 to save your game.'
  puts 'Press 3 to load your last save.'
  input = gets.chomp

  case input.to_i
  when 1
    b = Board.start_chess
    game = Game.new(b, Player.new(:white), Player.new(:black), RenderBoard)
    game.play
  when 2
    
  when 3
    board = Board.new
    saved_data = board.load_game
    data_hash = saved_data[:board].grid
    board.grid = Array.new(data_hash)
    game = Game.new(board, Player.new(:white), Player.new(:black), RenderBoard)
    game.play
  else
    puts 'i do not know that input'
  end
end

select_game