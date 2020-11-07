# frozen_string_literal: true

require './lib/player'

describe Player do
  subject(:player) { described_class.new }

  describe '#initialize' do
    it 'assigns @name' do
      expect(player.name).to be nil
    end

    it 'assigns @turn as false' do
      expect(player.turn).to be(true).or be(false)
    end

    it 'assigns @color' do
      expect(player.color).to be nil
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
      allow(player).to receive(:capture_input)
    end
    it 'outputs correct phrase' do
      correct_phrase = "What is your name? []\n"
      expect { player.ask_name }.to output(correct_phrase).to_stdout
    end
  end

  describe '#play_turn' do
    before do
      allow(player).to receive(:ask_turn)
    end
    it 'sends #ask_turn to self' do
      expect(player).to receive(:ask_turn)
      player.play_turn
    end
  end

  describe '#ask_turn' do
    before do
      allow(player).to receive(:capture_input)
    end
    it 'outputs correct phrase' do
      correct_phrase = ", where do you want to play? \n Enter the column number [0-6]\n"
      expect { player.ask_turn }.to output(correct_phrase).to_stdout
    end
  end

  describe '#switch_player' do
    context 'player.turn is false' do
      let(:player) { described_class.new(nil, false, nil) }

      it 'assigns @turn to true' do
        player.switch_player
        expect(player.turn).to be true
      end
    end

    context 'player.turn is true' do
      let(:player) { described_class.new(nil, true, nil) }

      it 'assigns @turn to false' do
        player.switch_player
        expect(player.turn).to be false
      end
    end
  end
end
