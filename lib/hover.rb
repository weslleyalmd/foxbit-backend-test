require 'byebug'

class Hover
  attr_accessor :x_coord, :y_coord, :direction

  DIRECTIONS = {
    N: {axis_to_move: "y", R: "E", L: "W", type: "add"},
    S: {axis_to_move: "y", R: "W", L: "E", type: "subtract"},
    E: {axis_to_move: "x", R: "S", L: "N", type: "add"},
    W: {axis_to_move: "x", R: "N", L: "S", type: "subtract"},
  }

  def initialize(x_coord, y_coord, direction)
    @x_coord = x_coord.to_i
    @y_coord = y_coord.to_i
    @direction = direction
  end

  def current_position
    "#{@x_coord} #{@y_coord} #{@direction}\n"
  end

  def move(instructions)
    instructions.each_char do |instruction|

      if instruction == "L" || instruction == "R"
        # GET new direction based on current direction (@direction attr)
        @direction = DIRECTIONS[@direction.to_sym][instruction.to_sym]
      end

      if instruction == "M"
        # GET type and axis_to_move based on current direction
        type = DIRECTIONS[@direction.to_sym][:type]
        axis_to_move = DIRECTIONS[@direction.to_sym][:axis_to_move]
        
        move_on_x(type) if axis_to_move == "x"
        move_on_y(type) if axis_to_move == "y"
      end

    end
  end

  private

  def move_on_x(type)
    @x_coord += 1 if type == "add"
    @x_coord -= 1 if type == "subtract"
  end

  def move_on_y(type)
    @y_coord += 1 if type == "add"
    @y_coord -= 1 if type == "subtract"
  end

end