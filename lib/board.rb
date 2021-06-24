require_relative 'pieces_files'
require_relative 'decorations'
require_relative 'render_board'

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
  end

  def place(position, piece)
    row, column = position
    grid[row][column] = piece
  end

  def in_bounds?(position)
    row, column = position

    row < grid.length && column < grid.first.length && !row.negative? && !column.negative?
  end
end