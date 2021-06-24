class Game

  def initialize(board, first_player, second_player, rendered_board)
    @board = board
    @rendered_board = rendered_board.new(board)
    @first_player = first_player
    @second_player = second_player
    @current_player = @first_player
  end

  def swap_players
    
  end
end