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
    let(:cells) { board.instance_variable_get(:@cells) }

    context 'makes @cells a 2d Array' do
      it '@cells is an Array' do
        board.create_board
        expect(cells).to be_a(Array)
      end

      it 'sends #create_row 6 times' do
        expect(board).to receive(:create_row).exactly(6).times
        board.create_board
      end

      it 'pushes 6 arrays to @cells' do
        board.create_board
        expect(cells.length).to be(6)
      end
    end

    context '@cells contains Arrays of coordinates' do
      it 'first element has 7 nested elements' do
        board.create_board
        expect(cells.first.length).to eq(7)
      end

      it 'last element has 7 nested elements' do
        board.create_board
        expect(cells.last.length).to eq(7)
      end
    end
  end
end
