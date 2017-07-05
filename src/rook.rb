require_relative 'chessman'

class Rook < Chessman
  private

  def valid_moves_mask
    moves = []
    (1..7).each do |i|
      moves << [0, i]
      moves << [0, -i]
      moves << [i, 0]
      moves << [-i, 0]
    end
    moves
  end
end
