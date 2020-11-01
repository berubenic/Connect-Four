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
end
