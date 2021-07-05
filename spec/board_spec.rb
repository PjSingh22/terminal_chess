require './lib/board'
require './lib/pieces/piece'
require './lib/pieces/knight'

describe Board do
  let(:board) { described_class.new }
  describe '[]=' do
    context 'when placing a piece' do
      it 'does not return nil on assigned position' do
        piece = Knight.new([1, 1], :black, board)
        allow(board).to receive(:[]=).with([1, 1], piece)
        expect(board.grid[1, 1]).to_not be(nil)
      end
    end 
  end
end