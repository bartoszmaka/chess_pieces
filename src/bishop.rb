require_relative 'chessman'

class Bishop < Chessman
  private

  def valid_moves_mask
    moves = []
    (1..7).each do |i|
      moves << [i, i]
      moves << [-i, i]
      moves << [i, -i]
      moves << [-i, -i]
    end
    moves
  end
end
