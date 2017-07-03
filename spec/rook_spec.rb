require_relative '../src/rook'

RSpec.describe Rook do
  describe '.new' do
    it 'should create new rook' do
      rook = Rook.new('d4')

      expect(rook).to be_a_kind_of Rook
    end

    it 'disallows creation at invalid position' do
      expect do
        Rook.new('a9')
      end.to raise_error Chessman::InvalidInputException
    end
  end

  describe '#valid_moves' do
    it 'should return array of valid move positions' do
      rook = Rook.new('d4')
      expected_positions = %w[a4 b4 c4 e4 f4 g4 h4 d1 d2 d3 d5 d6 d7 d8].sort

      expect(rook.valid_moves).to eq expected_positions
    end

    it 'should not include positions outside board' do
      rook = Rook.new('a1')
      expected_positions = %w[a2 a3 a4 a5 a6 a7 a8 b1 c1 d1 e1 f1 g1 h1].sort

      expect(rook.valid_moves).to eq expected_positions
    end
  end
end
