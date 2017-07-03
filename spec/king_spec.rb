require_relative '../src/king'

RSpec.describe King do
  describe '.new' do
    it 'should create new king' do
      king = King.new('d4')

      expect(king).to be_a_kind_of King
    end

    it 'disallows creation at invalid position' do
      expect do
        King.new('a9')
      end.to raise_error Chessman::InvalidInputException
    end
  end

  describe '#valid_moves' do
    it 'should return array of valid move positions' do
      king = King.new('d4')
      expected_positions = %w[c3 c4 c5 d3 d5 e3 e4 e5].sort

      expect(king.valid_moves).to eq expected_positions
    end

    it 'should not include positions outside board' do
      king = King.new('a1')
      expected_positions = %w[a2 b1 b2].sort

      expect(king.valid_moves).to eq expected_positions
    end
  end
end
