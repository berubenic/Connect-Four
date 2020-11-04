# frozen_string_literal: true

require './lib/player'

describe Player do
  subject(:player) { described_class.new }

  describe '#initialize' do
    it 'does not assign @name' do
      expect(player.name).to be nil
    end

    it 'assigns @turn as false' do
      expect(player.turn).to be(true).or be(false)
    end
  end

  describe '#prepare_game' do
    before do
      allow(player).to receive(:assign_name)
    end
    it 'sends #assign_name to self' do
      expect(player).to receive(:assign_name)
      player.prepare_game
    end
  end

  describe '#assign_name' do
    before do
      input = 'Bob'
      allow(player).to receive(:ask_name).and_return(input)
    end
    it 'assigns @name to Bob' do
      player.assign_name
      expect(player.name).to eq('Bob')
    end
  end

  describe '#ask_name' do
    before do
      allow(player).to receive(:capture_name)
    end
    it 'outputs correct phrase' do
      correct_phrase = "What is your name?\n"
      expect { player.ask_name }.to output(correct_phrase).to_stdout
    end
  end
end
