require './lib/board'
require './lib/render_board'
require './lib/player'
require_relative '../lib/game'

describe Game do
  let(:game) { described_class.new(Board.new, Player.new(:white), Player.new(:black), RenderBoard) }
  describe '#swap_players' do
    before { game.swap_player! }
    context 'when method is called' do
      it 'swaps current player to be second_player' do
        current_player = game.current_player
        player_two = game.player2

        expect(current_player).to be(player_two)
      end
    end
  end
end