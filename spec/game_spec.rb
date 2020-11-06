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

  describe '#play_turn' do
    let(:board) { instance_double(Board) }
    let(:player_one) { instance_double(Player) }
    let(:player_two) { instance_double(Player) }
    subject(:game) { described_class.new(board, player_one, player_two) }

    context 'player_one.turn is true and player_two.turn is false' do
      before do
        allow(player_one).to receive(:play_turn).and_return('some_move')
        allow(player_one).to receive(:turn).and_return(true)
        allow(player_two).to receive(:play_turn)
        allow(player_two).to receive(:turn).and_return(false)
      end

      it 'sends the #play_turn message to player_one' do
        expect(player_one).to receive(:play_turn)
        game.play_turn
      end

      it 'does not send the #play_turn message to player_two' do
        expect(player_two).not_to receive(:play_turn)
        game.play_turn
      end

      it 'assigns @move' do
        game.play_turn
        expect(game.move).not_to be nil
      end
    end

    context 'player_one.turn is false and player_two.turn is true' do
      before do
        allow(player_one).to receive(:play_turn)
        allow(player_one).to receive(:turn).and_return(false)
        allow(player_two).to receive(:play_turn).and_return('some_move')
        allow(player_two).to receive(:turn).and_return(true)
      end

      it 'does not send the #play_turn message to player_one' do
        expect(player_one).not_to receive(:play_turn)
        game.play_turn
      end

      it 'sends the #play_turn message to player_two' do
        expect(player_two).to receive(:play_turn)
        game.play_turn
      end

      it 'assigns @move' do
        game.play_turn
        expect(game.move).not_to be nil
      end
    end
  end

  describe '#validate_turn' do
    let(:board) { instance_double(Board) }
    let(:player_one) { instance_double(Player) }
    let(:player_two) { instance_double(Player) }
    subject(:game) { described_class.new(board, player_one, player_two) }

    context 'if valid_turn? is true it sends the #place_move message to board' do
      before do
        allow(player_one).to receive(:color)
        allow(player_one).to receive(:turn).and_return(true)
        allow(board).to receive(:valid_turn?).with(game.move).and_return(true)
        allow(board).to receive(:place_turn).with(game.move, player_one.color)
      end

      it 'sends the message #valid_turn? to board' do
        expect(board).to receive(:valid_turn?).with(game.move)
        game.validate_turn
      end

      it 'sends the message #place_turn to board' do
        expect(board).to receive(:place_turn).with(game.move, player_one.color)
        game.validate_turn
      end
    end

    context 'if valid_turn? is false it sends the #play_turn message to self' do
      before do
        allow(board).to receive(:valid_turn?).with(game.move).and_return(false)
        allow(game).to receive(:play_turn)
      end

      it 'sends the message #valid_turn? to board' do
        expect(board).to receive(:valid_turn?).with(game.move)
        game.validate_turn
      end

      it 'sends the message #play_turn to self' do
        expect(game).to receive(:play_turn)
        game.validate_turn
      end
    end
  end
end
