class Rook
  def initialize(position)
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

  def formatted_valid_moves_list
    valid_moves.join ' '
  end

  def position_moved_by(coords)
    x_shift, y_shift = coords
    [@x + x_shift, @y + y_shift]
  end

  def outside_board?(coords)
    coords.any? { |coord| coord > 7 || coord < 0 }
  end

  def chess_notation_to_array_indexes(position)
    letter, number = position.chars
    coord_x = ('a'..'g').to_a.index(letter.downcase)
    coord_y = (1..8).to_a.reverse.index(number.to_i)
    [coord_x, coord_y]
  end

  def array_indexes_to_chess_notation(position)
    x, y = position
    letter = ('a'..'h').to_a[x]
    number = (1..8).to_a.reverse[y]
    [letter, number].join
  end

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
