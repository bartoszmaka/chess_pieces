require_relative 'chessman'

class Knight < Chessman

  private

  def valid_moves_mask
    [
      [2, 1],
      [2, -1],
      [1, 2],
      [1, -2],
      [-2, 1],
      [-2, -1],
      [-1, 2],
      [-1, -2],
    ]
  end
end
