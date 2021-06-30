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

  def take_turn
    start_pos = nil
    # Prompt current player to enter a starting pos
     loop do
      puts 'Select a piece to move: '
      start_pos = current_player.pos_input

      if start_pos == 2
        board.save_game
      elsif start_pos == 3
        load_in_game
      elsif start_pos == 1
        puts 'incorrect input'
      else
        if board[start_pos].nil? || board[start_pos].color != current_player.color
          puts "Did not select a #{current_player.color} piece."
        elsif board[start_pos].color == current_player.color
          break
        end
      end
    end

    # Prompt current player to enter an ending pos
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
end