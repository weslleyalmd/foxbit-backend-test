class Hover
  attr_reader :x_coord, :y_coord, :direction

  def initializer(x_coord, y_coord, direction)
    @x_coord = x_coord
    @y_coord = y_coord
    @direction = direction
  end

  def current_position
    "#{x_coord} #{y_coord} #{direction}"
  end

end