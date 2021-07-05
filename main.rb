require_relative 'lib/player'
require_relative 'lib/board'
require_relative 'lib/game'
require_relative 'lib/render_board'
require_relative 'lib/pieces_files'
require_relative 'lib/intro_text'
require_relative 'lib/options'

# add tests for important parts
# create new game if player tries to load an empty or non existing file

# def select_game
#   intro
#   input = gets.chomp

#   case input.to_i
#   when 1
#     start_new_game
#   when 3
#     load_last_save
#   else
#     puts 'i do not know that input'
#   end
# end

# select_game

board = Board.new

board[[0, 0]] = King.new([0, 0], :black, board)
board[[6, 6]] = King.new([6, 6], :white, board)
board[[3, 0]] = Rook.new([3, 0], :white, board)
board[[3, 1]] = Rook.new([3, 1], :white, board)

RenderBoard.new(board).render

p Rook.new([3, 0], :white, board).available_moves
puts board.in_check?(:white)