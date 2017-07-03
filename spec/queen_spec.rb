require_relative '../src/queen'

RSpec.describe Queen do
  describe '.new' do
    it 'should create new queen' do
      queen = Queen.new('d4')

      expect(queen).to be_a_kind_of Queen
    end

    it 'disallows creation at invalid position' do
      expect do
        Queen.new('a9')
      end.to raise_error Chessman::InvalidInputException
    end
  end

  describe '#valid_moves' do
    it 'should return array of valid move positions' do
      queen = Queen.new('d4')
      expected_positions = %w[a1 a7 b2 b6 c3 c5 e3 e5 f2 f6 g1 g7 h8
                              a4 b4 c4 e4 f4 g4 h4 d1 d2 d3 d5 d6 d7 d8].sort

      expect(queen.valid_moves).to eq expected_positions
    end

    it 'should not include positions outside board' do
      queen = Queen.new('a1')
      expected_positions = %w[a2 a3 a4 a5 a6 a7 a8 b1 c1 d1 e1 f1 g1 h1
                              b2 c3 d4 e5 f6 g7 h8].sort

      expect(queen.valid_moves).to eq expected_positions
    end
  end
end
