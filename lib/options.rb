def start_new_game
  b = Board.start_chess
  game = Game.new(b, Player.new(:white), Player.new(:black), RenderBoard)
  game.play
end

def load_last_save
  board = Board.new
  saved_data = board.load_game
  data_hash = saved_data[:board].grid
  board.grid = Array.new(data_hash)
  game = Game.new(board, Player.new(:white), Player.new(:black), RenderBoard)
  game.play
end