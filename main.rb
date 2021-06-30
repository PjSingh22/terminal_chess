require_relative 'lib/player'
require_relative 'lib/board'
require_relative 'lib/game'
require_relative 'lib/render_board'
require_relative 'lib/pieces_files'
require_relative 'lib/intro_text'
require_relative 'lib/options'

# add tests for important parts


def select_game
  intro
  input = gets.chomp

  case input.to_i
  when 1
    start_new_game
  when 3
    load_last_save
  else
    puts 'i do not know that input'
  end
end

select_game
