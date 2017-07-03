require_relative 'chessman'

class King < Chessman

  private

  def valid_moves_mask
    [
      [0, 1],
      [0, -1],
      [1, 0],
      [-1, 0],
      [1, 1],
      [-1, 1],
      [1, -1],
      [-1, -1]
    ]
  end
end
