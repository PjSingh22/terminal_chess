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
      if board[start_pos].nil?
        puts "Did not select a #{current_player.color} piece."
      elsif board[start_pos].color == current_player.color
        break
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

  def save_game
    File.open('saved-game.yml', 'w') { |file| YAML.dump({ board: @board, current_player: @current_player }, file) }
    puts 'Game Saved!'
  end
# work on loading game
  def load_game
    yaml = YAML.load_file('saved-game.yml')
    @board = yaml[0]
    renderer.render
    puts 'Save Loaded'
  end
end