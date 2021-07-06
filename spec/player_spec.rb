require './lib/player'

describe Player do
  let(:player) { described_class.new(:black) }
  describe '#translate_input' do
    it 'tranlates given input into array index' do
      translate = player.translate_input('a1')
      expect(translate).to eq([7, 0])
    end
  end
end
