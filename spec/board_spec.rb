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
    it 'sends #create_board to self' do
      expect(board).to respond_to(:create_board)
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

  describe '#valid_number' do
    it 'returns true if move is a number between 0 and 6' do
      move = '0'
      expect(board.valid_number?(move)).to be true
    end

    it 'returns false if move is greater than 6' do
      move = '7'
      expect(board.valid_number?(move)).to be false
    end

    it 'returns false if move is less than zero' do
      move = '-1'
      expect(board.valid_number?(move)).to be false
    end
  end

  describe '#invalid_number_message' do
    it 'outputs correct phrase' do
      correct_phrase = "Invalid move, must be a number between 0 and 6\n"
      expect { board.invalid_number_message }.to output(correct_phrase).to_stdout
    end
  end

  describe '#top_row_content' do
    before do
      board.create_board
    end

    it 'returns an array' do
      expect(board.top_row_content).to be_a(Array)
    end

    it 'all elements are nil when board is created' do
      expect(board.top_row_content.all?(&:nil?)).to be true
    end
  end
end
