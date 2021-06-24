require_relative 'pieces_files'

class Board
  attr_accessor :grid

  def self.start_chess
    board = self.new
    8.times do |c|
      board[[1, c]] = Pawn.new([1, c], :black, board)
      board[[6, c]] = Pawn.new([6, c], :white, board)
    end

    [[0, :black], [7, :white]].each do |(r, color)|
      board[[r, 0]] = Rook.new([r, 0], color, board)
      board[[r, 7]] = Rook.new([r, 7], color, board)
      board[[r, 1]] = Knight.new([r, 1], color, board)
      board[[r, 6]] = Knight.new([r, 6], color, board)
      board[[r, 2]] = Bishop.new([r, 2], color, board)
      board[[r, 5]] = Bishop.new([r, 5], color, board)
      board[[r, 3]] = King.new([r, 3], color, board)
      board[[r, 4]] = Queen.new([r, 4], color, board)
    end
    board
  end

  def initialize
    @grid = Array.new(8) { Array.new(8) }
  end

  def []=(position, piece)
    row, column = position
    grid[row][column] = piece
  end

  def [](position)
    row, column = position
    grid[row][column]
  end

  def in_bounds?(position)
    row, column = position

    row < grid.length && column < grid.first.length && !row.negative? && !column.negative?
  end
end