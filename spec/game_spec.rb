require './lib/board'
require './lib/render_board'
require './lib/player'
require_relative '../lib/game'

describe Game do
  let(:game) { described_class.new(Board.start_chess, Player.new(:white), Player.new(:black), RenderBoard) }
  describe '#swap_players' do
    context 'when method is called' do
      it 'swaps current player to be second_player' do
        game.swap_player!
        expect(game.current_player).to be(game.player2)
      end
    end
  end

  describe '#take_turn' do
    
  end
end