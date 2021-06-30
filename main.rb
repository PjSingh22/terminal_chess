require_relative 'lib/player'
require_relative 'lib/board'
require_relative 'lib/game'
require_relative 'lib/render_board'
require_relative 'lib/pieces_files'
require_relative 'lib/intro_text'

# add serialization
# add tests for important parts
# BONUS:
# add ability to cancel move
# add playing against cpu

def select_game
  intro
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