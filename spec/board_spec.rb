# frozen_string_literal: true

require './lib/board'

describe Board do
  subject(:board) { described_class.new }
  let(:cells) { board.instance_variable_get(:@cells) }

  describe '#initialize' do
    it 'assigns @cells' do
      expect(cells).to be nil
    end
  end

  describe '#prepare_game' do
    before do
      allow(board).to receive(:create_board)
    end
    it 'sends #create_board to self' do
      expect(board).to receive(:create_board)
      board.prepare_game
    end
  end

  describe '#create_board' do
    it 'assigns @cells a Array' do
      board.create_board
      expect(cells).to be_a(Array)
    end

    it 'is not an empty Array' do
      board.create_board
      expect(cells.empty?).not_to be true
    end
  end

  describe '#create_row' do
    it 'returns an Array' do
      y_coordinate = 'some_coordinate'
      expect(board.create_row(y_coordinate)).to be_a(Array)
    end
  end
end
