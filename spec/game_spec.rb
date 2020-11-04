# frozen_string_literal: true

require './lib/game'

describe Game do
  describe '#initialize' do
    subject(:game) { described_class.new }
    let(:board) { game.instance_variable_get(:@board) }
    let(:player_one) { game.instance_variable_get(:@player_one) }
    let(:player_two) { game.instance_variable_get(:@player_two) }

    it 'assigns @board' do
      expect(board).not_to be nil
    end

    it 'assigns @player_one' do
      expect(player_one).not_to be nil
    end

    it 'assigns @player_two' do
      expect(player_two).not_to be nil
    end
  end

  describe '#prepare_game' do
    let(:board) { instance_double(Board) }
    let(:player_one) { instance_double(Player) }
    let(:player_two) { instance_double(Player) }
    subject(:game) { described_class.new(board, player_one, player_two) }

    before do
      allow(board).to receive(:prepare_game)
      allow(player_one).to receive(:prepare_game)
      allow(player_two).to receive(:prepare_game)
    end

    it 'sends the #prepare_game message to board' do
      expect(board).to receive(:prepare_game)
      game.prepare_game
    end

    it 'sends the #prepare_game message to player_one' do
      expect(board).to receive(:prepare_game)
      game.prepare_game
    end

    it 'sends the #prepare_game message to player_two' do
      expect(board).to receive(:prepare_game)
      game.prepare_game
    end
  end
end
