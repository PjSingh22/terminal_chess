require_relative 'pieces_files'
require_relative 'decorations'

class Board
  attr_accessor :grid

  def self.start_chess
    board = self.new
    8.times do |c|
      board.grid[1, c] = Pawn.new(board, [1, c], :black)
      board.grid[6, c] = Pawn.new(board, [6, c], :white)
    end
    [[0, :black], [7, :white]].each do |(r, color)|
      board.grid[r, 0] = Rook.new(board, [r, 0], color)
      board.grid[r, 7] = Rook.new(board, [r, 7], color)
      board.grid[r, 1] = Knight.new(board, [r, 1], color)
      board.grid[r, 6] = Knight.new(board, [r, 6], color)
      board.grid[r, 2] = Bishop.new(board, [r, 2], color)
      board.grid[r, 5] = Bishop.new(board, [r, 5], color)
      board.grid[r, 3] = Queen.new(board, [r, 3], color)
      board.grid[r, 4] = King.new(board, [r, 4], color)
    end
    board
  end

  def initialize
    @grid = Array.new(8) { Array.new(8) }
  end

  def display
    system 'clear'
    display_top_border
    display_rows
    display_bottom_border
    display_x_axis
  end

  def display_top_border
    puts '   ┌────┬────┬────┬────┬────┬────┬────┬────┐'
  end

  def display_bottom_border
    puts '   └────┴────┴────┴────┴────┴────┴────┴────┘'
  end

  def display_row_separator
    puts '   ├────┼────┼────┼────┼────┼────┼────┼────┤'
  end

  def display_x_axis
    puts "     a     b    c    d    e    f    g    h  \n\n"
  end

  def display_rows
    1.upto(7) do |row|
      row(row)
      display_row_separator
    end
    row(8)
  end

  def row(number)
    square = number.even? ? 0 : 1
    print "#{9 - number}  "
    @grid[number - 1].each do |position|
      if position.nil?
        print square.even? ? '│    ' : "│#{'    '.bg_black}"
      else
        print square.even? ? "│ #{position.symbol}  " : "│#{" #{position.symbol}  ".bg_black}"
      end
      square += 1
    end
    puts '│'
  end
end