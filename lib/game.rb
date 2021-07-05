require 'yaml'

class Game
  attr_reader :player1, :player2, :board, :renderer
  attr_accessor :current_player

  def initialize(board, player1, player2, renderer_class)
    @board = board
    @renderer = renderer_class.new(board)
    @player1 = player1
    @player2 = player2
    @current_player = @player1
  end

  def swap_player!
    self.current_player = (current_player == player1 ? player2 : player1)
  end

  def play
    until game_over?
      renderer.render
      puts "It's #{current_player.color}'s turn"
      if board.in_check?(current_player.color)
        puts "#{current_player.color} is in check."
      end

      take_turn
      swap_player!
    end

    swap_player!
    renderer.render
    puts "Game over! The winner is: #{current_player.color}"
  end

  def game_over?
    board.checkmate?(current_player.color)
  end

#take_turn is a really really long method that is doing a lot of different things. Are you using rubocop to help you follow the Ruby Style Guide? 

# I'd highly recommend breaking that method up into smaller helper methods. The names of these helper methods will help document what the code is doing & you will not need to write in separate comments. In addition, you might also find that some of this logic might belong in Board instead of Game. 

# As you break this down, focus on how you can test this behavior. You will not be able to set the variable start_pos in a test, so look at other ways that you can test this. Often times, I like to pass in the needed information as a parameter, but that is not the only option.

  def take_turn(start_pos = nil, end_pos = nil)
     loop do
      puts 'Select a piece to move: '
      start_pos = current_player.pos_input
      begin
      if check_turn_input(start_pos) == false
        if incorrect_move?(start_pos)
          puts "Did not select a #{current_player.color} piece."
        elsif board[start_pos].color == current_player.color
          break
        end
      end
      rescue => e
        puts 'Incorrect Input!'
      end
    end

    loop do
      puts 'Select a position to move to:'
      end_pos = current_player.pos_input

      # Move the piece
      begin
        board.move_piece(start_pos, end_pos)
        break
      rescue => e
        puts e.message
      end
    end
  end

  def load_in_game
    board = Board.new
    saved_data = board.load_game
    data_hash = saved_data[:board].grid
    board.grid = Array.new(data_hash)
    game = Game.new(board, Player.new(:white), Player.new(:black), RenderBoard)
    game.play
  end

  private

  def incorrect_move?(start_pos)
    board[start_pos].nil? || board[start_pos].color != current_player.color
  end

  def check_turn_input(input)
    case input
    when 2 
      board.save_game
    when 3
      load_in_game
    when 1
      puts 'incorrect input'
    else
      false
    end
  end
end