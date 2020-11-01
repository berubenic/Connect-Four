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

    context 'when creating instance variable @player_two' do
      let(:player_two) { game.instance_variable_get(:@player_two) }

      it 'creates player_two' do
        expect(player_two).to be_a(Player)
      end
    end
  end

  describe '#prepare_game' do
    context 'send prepare_game to @board' do
      let(:board) { game.instance_variable_get(:@board) }

      it 'responds to the prepare_game message' do
        game.prepare_game
        expect(board).to respond_to(:prepare_game)
      end
    end

    context 'send prepare_game to @player_one and @player_two' do
      let(:player_one) { game.instance_variable_get(:@player_one) }
      let(:player_two) { game.instance_variable_get(:@player_two) }

      it 'player_one responds to the the prepare_game message' do
        game.prepare_game
        expect(player_one).to respond_to(:prepare_game)
      end

      it 'player_two responds to the prepare_game message' do
        game.prepare_game
        expect(player_two).to respond_to(:prepare_game)
      end
    end
  end
end
