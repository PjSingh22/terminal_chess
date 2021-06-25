class Pawn < Piece
  def foreward_dir
    color == :black ? 1 : -1
  end

  def at_start?
    (color == :black && current_r == 1) || (color == :white && current_r == 6)
  end

  def available_moves
    moves = []

    one_foreward = [current_r + foreward_dir, current_c]

    if board.empty?(one_foreward)
      moves << one_foreward
    end

    two_foreward = [current_r + (foreward_dir * 2), current_c]

    if board.empty?(two_foreward) && board.empty?(one_foreward) && at_start?
      moves << two_foreward
    end

    diag_left = [current_r + foreward_dir, current_c + 1]
    diag_right = [current_r + foreward_dir, current_c - 1]

    if enemy?(diag_left)
      moves << diag_left
    end

    if enemy?(diag_right)
      moves << diag_right
    end

    moves.select { |move| board.in_bounds?(move) }
  end

  def to_s
    color == :white ? '♟︎' : '♙'
  end
end