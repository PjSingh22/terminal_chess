class RenderBoard
  attr_accessor :board

  def initialize(board)
    @board = board
  end

  def display
    system 'clear'
    render_pieces
    display_top_border
    display_rows
    display_bottom_border
    display_x_axis
  end


  def render_pieces
    white_piece_placement
    black_piece_placement
    pawns
    
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
    board.grid[number - 1].each do |position|
      if position.nil?
        print square.even? ? '│    ' : "│#{'    '.bg_black}"
      else
        print square.even? ? "│ #{position.symbol}  " : "│#{" #{position.symbol}  ".bg_black}"
      end
      square += 1
    end
    puts '│'
  end

  def white_piece_placement
    @board.grid[7][0] = Rook.new([7, 0], :white, board)
    @board.grid[7][1] = Knight.new([7, 1], :white, board)
    @board.grid[7][2] = Bishop.new([7, 2], :white, board)
    @board.grid[7][3] = Queen.new([7, 3], :white, board)
    @board.grid[7][4] = King.new([7, 4], :white, board)
    @board.grid[7][5] = Bishop.new([7, 5], :white, board)
    @board.grid[7][6] = Knight.new([7, 6], :white, board)
    @board.grid[7][7] = Rook.new([7, 7], :white, board)
  end

  def black_piece_placement
    @board.grid[0][0] = Rook.new([0, 0], :black, board)
    @board.grid[0][1] = Knight.new([0, 1], :black, board)
    @board.grid[0][2] = Bishop.new([0, 2], :black, board)
    @board.grid[0][3] = Queen.new([0, 3], :black, board)
    @board.grid[0][4] = King.new([0, 4], :black, board)
    @board.grid[0][5] = Bishop.new([0, 5], :black, board)
    @board.grid[0][6] = Knight.new([0, 6], :black, board)
    @board.grid[0][7] = Rook.new([0, 7], :black, board)
  end

  def pawns
    0.upto(7) do |idx|
      @board.grid[6][idx] = Pawn.new([6, idx], :white, board)
      @board.grid[1][idx] = Pawn.new([1, idx], :black, board)
    end
  end

end