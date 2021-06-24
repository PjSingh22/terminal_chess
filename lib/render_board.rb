class RenderBoard
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def clear
    system 'clear'
    system 'cls'
  end

  def render
    clear
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
      render_row(row)
      display_row_separator
    end
    render_row(8)
  end

  def render_row(number)
    square = number.even? ? 0 : 1
    print "#{9 - number}  "
    @board[number - 1].each do |position|
      if position.nil?
        print square.even? ? '│    ' : "│#{'    '.bg_black}"
      else
        position = position.to_s
        print square.even? ? "│ #{position}  " : "│#{" #{position}  ".bg_black}"
      end
      square += 1
    end
    puts '│'
  end
end