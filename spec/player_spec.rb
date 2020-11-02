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

  describe '#prepare_game' do
    context 'self responds to ask_name' do
      it 'sends ask_name' do
        expect(player).to respond_to(:assign_name)
      end
    end
  end

  describe '#assign_name' do
    context 'user input is assigned to @name' do
      before do
        input = 'Bob'
        allow(player).to receive(:input_name).and_return(input)
      end
      it 'assigns @name to Bob' do
        player.assign_name
        expect(player.name).to eq('Bob')
      end
    end
  end
end
