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
    it 'creates board and assigns it to @cell' do
      board.prepare_game
      expect(board.cells).not_to be nil
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

    describe '#place_turn' do
      before do
        board.prepare_game
      end

      it 'sends #update_content to a instance of Cell' do
        move = 'some_move'
        color = 'some_color'
        expect(board.place_turn(move, color)).to eq(color)
        board.place_turn(move, color)
      end
    end

    describe '#verify_win?' do
      context '4 red cells are aligned horizontally' do
        before do
          board.prepare_game
          board.place_turn(0, 'red')
          board.place_turn(1, 'red')
          board.place_turn(2, 'red')
          board.place_turn(3, 'red')
        end

        it 'returns true' do
          expect(board.verify_win?).to be true
        end
      end

      context '2 red cells and 2 blue cells are aligned horizontally' do
        before do
          board.prepare_game
          board.place_turn(0, 'blue')
          board.place_turn(1, 'blue')
          board.place_turn(2, 'red')
          board.place_turn(3, 'red')
        end

        it 'returns false' do
          expect(board.verify_win?).to be false
        end
      end

      context '4 red cells are aligned vertically' do
        before do
          board.prepare_game
          board.place_turn(0, 'red')
          board.place_turn(0, 'red')
          board.place_turn(0, 'red')
          board.place_turn(0, 'red')
        end

        it 'returns true' do
          expect(board.verify_win?).to be true
        end
      end

      context '2 red cells and 2 blue cells are aligned vertically' do
        before do
          board.prepare_game
          board.place_turn(0, 'red')
          board.place_turn(0, 'red')
          board.place_turn(0, 'blue')
          board.place_turn(0, 'blue')
        end

        it 'returns false' do
          expect(board.verify_win?).to be false
        end
      end

      context '4 red cells are aligned right-diagonally' do
        before do
          board.prepare_game
          board.place_turn(6, 'red')
          board.place_turn(5, 'blue')
          board.place_turn(5, 'red')
          board.place_turn(4, 'blue')
          board.place_turn(4, 'blue')
          board.place_turn(4, 'red')
          board.place_turn(3, 'blue')
          board.place_turn(3, 'blue')
          board.place_turn(3, 'blue')
          board.place_turn(3, 'red')
        end

        it 'returns true' do
          expect(board.verify_win?).to be true
        end
      end

      context '4 red cells are aligned left-diagonally' do
        before do
          board.prepare_game
          board.place_turn(0, 'red')
          board.place_turn(1, 'blue')
          board.place_turn(1, 'red')
          board.place_turn(2, 'blue')
          board.place_turn(2, 'blue')
          board.place_turn(2, 'red')
          board.place_turn(3, 'blue')
          board.place_turn(3, 'blue')
          board.place_turn(3, 'blue')
          board.place_turn(3, 'red')
        end

        it 'returns true' do
          expect(board.verify_win?).to be true
        end
      end
    end
  end

  describe '#print_board' do
    context 'when board is empty' do
      before do
        board.prepare_game
      end

      it 'prints board' do
      end
    end
  end
end
