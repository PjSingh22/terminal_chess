require './lib/board'
require './lib/pieces/piece'
require './lib/pieces/knight'

describe Board do
  let(:board) { described_class.new }
  describe '#[]=' do
    context 'when placing a piece' do
      it 'does not return nil on assigned position' do
        piece = Knight.new([1, 1], :black, board)
        grid_pos = board.grid[1, 1]

        allow(board).to receive(:[]=).with([1, 1], piece)
        expect(grid_pos).to_not be(nil)
      end
    end 
  end

  describe '#move_piece' do
    let(:board) { described_class.start_chess }
    it 'moves piece to given end_pos' do
      allow(board).to receive(:move_piece).with([6, 0], [5, 0])
      expect(board.grid[5, 0]).to_not be(nil)
    end

    it 'raises in_bounds? error' do
      expect { board.move_piece([6, 0], [5, 9]) }.to raise_error
    end
  end

  describe '#in_check?' do
    before do
      board[[0, 0]] = King.new([0, 0], :black, board)
      board[[6, 6]] = King.new([6, 6], :white, board)
      board[[3, 0]] = Rook.new([3, 0], :white, board)
      board[[3, 1]] = Rook.new([3, 1], :white, board)
    end
    it 'returns true when king is in check' do
      check = board.in_check?(:black)
      expect(check).to be(true)
    end
  end

  describe '#checkmate' do
    before do
      board[[0, 0]] = King.new([0, 0], :black, board)
      board[[6, 6]] = King.new([6, 6], :white, board)
      board[[3, 0]] = Rook.new([3, 0], :white, board)
      board[[3, 1]] = Rook.new([3, 1], :white, board)
    end
    it 'returns true when king is in check' do
      checkmate = board.checkmate?(:black)
      allow(board).to receive(:in_check?).with(:black).and_return(true)
      expect(checkmate).to be(true)
    end
  end
end