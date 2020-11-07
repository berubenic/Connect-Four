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

  describe '#valid_number?' do
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

  describe '#column_not_full?' do
    before do
      allow(board).to receive(:top_row_content).and_return(['blue', nil, nil, nil, nil, nil, nil])
    end

    it 'returns true if column that corresponds to move is not full' do
      move = '1'
      expect(board.column_not_full?(move)).to be true
    end

    it 'returns false if column that corresponds to move is full' do
      move = '0'
      expect(board.column_not_full?(move)).to be false
    end
  end

  describe '#valid_turn?' do
    context '#valid_number? is true and #column_not_full? is true' do
      before do
        allow(board).to receive(:valid_number?).and_return(true)
        allow(board).to receive(:column_not_full?).and_return(true)
      end

      it 'returns true' do
        move = 'some_move'
        expect(board.valid_turn?(move)).to be true
      end
    end

    context '#valid_number? is true and #column_not_full? is false' do
      before do
        allow(board).to receive(:valid_number?).and_return(true)
        allow(board).to receive(:column_not_full?).and_return(false)
      end

      it 'returns false' do
        move = 'some_move'
        expect(board.valid_turn?(move)).to be false
      end
    end

    context '#valid_number? is false and #column_not_full? is true' do
      before do
        allow(board).to receive(:valid_number?).and_return(false)
        allow(board).to receive(:column_not_full?).and_return(true)
      end

      it 'returns false' do
        move = 'some_move'
        expect(board.valid_turn?(move)).to be false
      end

      it 'does not send #column_not_full?' do
        move = 'some_move'
        expect(board).not_to receive(:column_not_full?)
        board.valid_turn?(move)
      end
    end

    context '#valid_number? is false and #column_not_full? is false' do
      before do
        allow(board).to receive(:valid_number?).and_return(false)
        allow(board).to receive(:column_not_full?).and_return(false)
      end

      it 'returns false' do
        move = 'some_move'
        expect(board.valid_turn?(move)).to be false
      end

      it 'does not send #column_not_full?' do
        move = 'some_move'
        expect(board).not_to receive(:column_not_full?)
        board.valid_turn?(move)
      end
    end
  end

  describe '#place_turn' do
    before do
      allow(board).to receive(:find_empty_cell)
      board.create_board
    end

    it 'sends #find_empty_cell to self' do
      move = 'some_move'
      color = 'some_color'
      expect(board).to receive(:find_empty_cell)
      board.place_turn(move, color)
    end
  end

  describe '#find_empty_cell' do
    let(:cell) { board.cells[5][0] }

    before do
      board.create_board
      allow(cell).to receive(:update_content)
    end

    it 'sends #update_content to cell' do
      column = [cell]
      color = 'some_color'
      expect(cell).to receive(:update_content)
      board.find_empty_cell(column, color)
    end
  end

  describe '#verify_win' do
    before do
      allow(board).to receive(:diagonals)
    end

    it 'sends #diagonals to self' do
      expect(board).to receive(:diagonals)
      board.verify_win
    end
  end

  describe '#diagonals' do
    before do
      allow(board).to receive(:left_diagonals)
    end

    it 'sends #left_diagonals to self' do
      expect(board).to receive(:left_diagonals)
      board.diagonals
    end
  end

  describe '#left_diagonals' do
  end

  describe '#keep_length_of_at_least_four' do
    it 'nested elements are only length of four' do
      arr = [[1], [1, 2, 3, 4], [1, 2, 3], [1, 2, 3, 4, 5]]
      result = board.keep_length_of_at_least_four(arr)
      expect(result).to eq([[1, 2, 3, 4], [1, 2, 3, 4, 5]])
    end
  end

  describe '#set_left_diagonals' do
    before do
      board.create_board
    end
    it 'returns an array' do
      expect(board.set_left_diagonals).to be_a(Array)
    end
  end
end
