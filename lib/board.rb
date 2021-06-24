require_relative 'pieces_files'
require_relative 'decorations'
require_relative 'render_board'

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
  end

end