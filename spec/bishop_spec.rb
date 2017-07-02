require_relative '../src/bishop'

RSpec.describe Bishop do
  describe '.new' do
    it 'should create new bishop' do
      bishop = Bishop.new('d4')

      expect(bishop).to be_a_kind_of Bishop
    end
  end

  describe '#valid_moves' do
    it 'should return array of valid move positions' do
      bishop = Bishop.new('d4')
      expected_positions = %w[a1 a7 b2 b6 c3 c5 e3 e5 f2 f6 g1 g7 h8].sort

      expect(bishop.valid_moves).to eq expected_positions
    end

    it 'should not include positions outside board' do
      bishop = Bishop.new('a1')
      expected_positions = %w[b2 c3 d4 e5 f6 g7 h8].sort

      expect(bishop.valid_moves).to eq expected_positions
    end
  end
end
