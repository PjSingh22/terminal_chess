require './lib/board'
require './lib/pieces/piece'
require './lib/pieces/knight'

describe Board do
  let(:board) { described_class.new }
  describe '#[]=' do
    context 'when placing a piece' do
      it 'does not return nil on assigned position' do
        piece = Knight.new([1, 1], :black, board)
        allow(board).to receive(:[]=).with([1, 1], piece)
        expect(board.grid[1, 1]).to_not be(nil)
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

  describe '#checkmate' do #fix empty? method
    before do
      board[[0, 0]] = King.new([0, 0], :black, board)
      board[[6, 6]] = King.new([6, 6], :white, board)
      board[[3, 0]] = Rook.new([3, 0], :white, board)
      board[[3, 1]] = Rook.new([3, 1], :white, board)
    end
    it 'returns true if king is in check' do
      allow(board).to receive(:in_check?).with(:black).and_return(true)
      expect(board.checkmate?(:black)).to be(true)
    end
  end
end