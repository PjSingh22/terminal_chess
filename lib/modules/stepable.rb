module Stepable

  def available_moves
    moves = []

    move_set.each do |(dr, dc)|
      current_r, current_c = position

      current_r += dr
      current_c += dc
      pos = [current_r, current_c]
      next unless board.in_bounds?(pos)

      if board.empty?(pos, color) || enemy?(pos)
        moves << pos
      end
    end
    moves
  end
end