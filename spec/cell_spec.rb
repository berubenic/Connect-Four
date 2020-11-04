# frozen_string_literal: true

require './lib/cell'

describe Cell do
  describe '#initialize' do
    subject(:cell) { described_class.new(0, 0) }
    let(:coordinate) { cell.instance_variable_get(:@coordinate) }
    let(:content) { cell.instance_variable_get(:@content) }

    context 'initialize with x = 0 and y = 1' do
      subject(:cell) { described_class.new(0, 1) }

      it 'assigns @coordinate [0, 1]' do
        expect(coordinate).to eq([0, 1])
      end
    end

    context 'initialize with x = 6 and y = 6' do
      subject(:cell) { described_class.new(6, 6) }

      it 'assigns @coordinate [6, 6]' do
        expect(coordinate).to eq([6, 6])
      end
    end

    it 'assigns nil to @content' do
      expect(content).to be nil
    end
  end
end
