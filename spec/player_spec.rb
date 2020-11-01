# frozen_string_literal: true

require './lib/player'

describe Player do
  subject(:player) { described_class.new }

  describe '#initialize' do
    context 'when player is first initialized in Game' do
      it 'creates @name with value of nil' do
        expect(player.name).to be nil
      end

      it 'creates @turn as false' do
        expect(player.turn).to be false
      end
    end
  end
end
