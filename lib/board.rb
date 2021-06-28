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

    row < grid.length && column < grid.first.length && row >= 0 && column >= 0
  end

  def empty?(position)
    row, column = position
    grid[row][column].nil?
  end

  def in_check?(color)
    king = pieces.find { |piece| piece.color == color && piece.is_a?(King) }

    if king.nil?
      raise 'King not found'
    end

    king_pos = king.position

    pieces.reject { |p| p.color == color }.each do |piece|
      if piece.available_moves.include?(king_pos)
        return true
      end
    end
    false
  end

  def pieces
    grid.flatten.reject { |piece| piece.nil? }
  end

  def move_piece(start_pos, end_pos)
    piece = self[start_pos]

    unless piece.available_moves.include?(end_pos)
      raise "End position (#{end_pos}) not in available moves: #{piece.available_moves}"
    end

    raise 'End position not in bounds of board' unless in_bounds?(end_pos)

    self[end_pos] = piece
    self[start_pos] = nil

    piece.position = end_pos
  end
end