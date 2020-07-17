class Hover
  attr_accessor :x_coord, :y_coord, :direction

  def initialize(x_coord, y_coord, direction)
    @x_coord = x_coord
    @y_coord = y_coord
    @direction = direction
  end

  def current_position
    "#{x_coord} #{y_coord} #{direction}"
  end

  def move(instructions)
    instructions.each_char do |i|
    end
  end 

end