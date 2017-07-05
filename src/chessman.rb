class Chessman
  attr_accessor :x, :y

  class InvalidInputException < StandardError
  end

  def initialize(position)
    validate_given_position(position)
    @x, @y = chess_notation_to_array_indexes(position)
    puts formatted_valid_moves_list
  end

  def valid_moves
    moves = []
    valid_moves_mask.each do |coords|
      moved_position = position_moved_by(coords)
      moves << moved_position unless outside_board?(moved_position)
    end
    moves.compact.map { |position| array_indexes_to_chess_notation(position) }.sort
  end

  private

  def validate_given_position(position)
    valid_pattern = /\A[a-h][1-8]\z/
    return if position =~ valid_pattern
    raise InvalidInputException, "expected chess notation, got #{position}"
  end

  def formatted_valid_moves_list
    valid_moves.join ' '
  end

  def position_moved_by(coords)
    x_shift, y_shift = coords
    [x + x_shift, y + y_shift]
  end

  def outside_board?(coords)
    coords.any? { |coord| coord > 7 || coord < 0 }
  end

  def chess_notation_to_array_indexes(position)
    letter, number = position.chars
    coord_x = ('a'..'h').to_a.index(letter.downcase)
    coord_y = (1..8).to_a.reverse.index(number.to_i)
    [coord_x, coord_y]
  end

  def array_indexes_to_chess_notation(position)
    x, y = position
    letter = ('a'..'h').to_a[x]
    number = (1..8).to_a.reverse[y]
    [letter, number].join
  end

  def valid_moves_mask() end
end
