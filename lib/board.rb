require_relative 'pieces_files'

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
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
    @positions[number - 1].each do |position|
      if position == '.'
        print square.even? ? '│    ' : "│#{'    '.bg_black}"
      else
        print square.even? ? "│ #{position.symbol}  " : "│#{" #{position.symbol}  ".bg_black}"
      end
      square += 1
    end
    puts '│'
  end
end