# frozen_string_literal: true

require './lib/game'

describe Game do
  subject(:game) { described_class.new }

  describe '#initialize' do
    context 'when creating instance variable @board' do
      let(:board) { game.instance_variable_get(:@board) }
      it 'creates a Board' do
        expect(board).to be_a(Board)
      end
    end

    context 'when creating instance variable @player_one' do
      let(:player_one) { game.instance_variable_get(:@player_one) }
      it 'creates player_one' do
        expect(player_one).to be_a(Player)
      end
    end
  end
end
