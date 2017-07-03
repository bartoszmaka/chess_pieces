require_relative '../src/knight'

RSpec.describe Knight do
  describe '.new' do
    it 'should create new knight' do
      knight = Knight.new('d4')

      expect(knight).to be_a_kind_of Knight
    end

    it 'disallows creation at invalid position' do
      expect do
        Knight.new('a9')
      end.to raise_error Chessman::InvalidInputException
    end
  end

  describe '#valid_moves' do
    it 'should return array of valid move positions' do
      knight = Knight.new('d4')
      expected_positions = %w[b3 b5 c2 c6 e2 e6 f3 f5].sort

      expect(knight.valid_moves).to eq expected_positions
    end

    it 'should not include positions outside board' do
      knight = Knight.new('a1')
      expected_positions = %w[b3 c2].sort

      expect(knight.valid_moves).to eq expected_positions
    end
  end
end
