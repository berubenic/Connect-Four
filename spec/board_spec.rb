# frozen_string_literal: true

require './lib/board'

describe Board do
  subject(:board) { described_class.new }

  describe '#initialize' do
    context 'before game is setup' do
      let(:cells) { board.instance_variable_get(:@cells) }

      it 'has an empty @cells variable' do
        expect(cells).to be nil
      end
    end
  end

  describe '#prepare_game' do
    context 'creates board' do
      it 'self responds to create_board' do
        expect(board).to respond_to(:create_board)
      end
    end
  end

  describe '#create_board' do
    context 'makes @cells a 2d Array' do
      let(:cells) { board.instance_variable_get(:@cells) }

      it '@cells is an Array' do
        board.create_board
        expect(cells).to be_a(Array)
      end
    end
  end
end
