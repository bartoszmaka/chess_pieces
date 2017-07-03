require_relative 'chessman'

class Queen < Chessman

  private

  def valid_moves_mask
    moves = []
    (1..7).each do |i|
      moves << [0, i]
      moves << [0, -i]
      moves << [i, 0]
      moves << [-i, 0]
      moves << [i, i]
      moves << [-i, i]
      moves << [i, -i]
      moves << [-i, -i]
    end
    moves
  end
end
