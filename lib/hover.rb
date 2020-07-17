require 'byebug'
class Hover
  attr_accessor :x_coord, :y_coord, :direction, :collision_warn, :out_of_boundary

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
    @collision_warn = false
    @out_of_boundary = false
  end

  def current_position
    collision_warning = @collision_warn ? " - Collision Warning: hover movement halted" : ""
    out_of_boundary_warning = @out_of_boundary ? " - Warning: This hover is out of boundary" : ""
    "#{@x_coord} #{@y_coord} #{@direction}#{collision_warning}#{out_of_boundary_warning}\n"
  end

  def move(instructions, plateau)
    instructions.each_char do |instruction|
      break if @collision_warn

      if instruction == "L" || instruction == "R"
        # GET new direction based on current direction (@direction attr)
        @direction = DIRECTIONS[@direction.to_sym][instruction.to_sym]
      end

      if instruction == "M"
        # GET type and axis_to_move based on current direction
        type = DIRECTIONS[@direction.to_sym][:type]
        axis_to_move = DIRECTIONS[@direction.to_sym][:axis_to_move]
        old_x_coord = @x_coord
        old_y_coord = @y_coord
        
        if axis_to_move == "x"
          new_x_coord = move_on_x(type)

          # check if next tile with new_x_coord if free
          if plateau.tile_is_free?(new_x_coord, @y_coord)
            # if true, set new x_coord
            @x_coord = new_x_coord
          else
            # if false, just mark collision warning
            @collision_warn = true
          end
        end

        if axis_to_move == "y"
          new_y_coord = move_on_y(type)

          # check if next tile with new_y_coord if free
          if plateau.tile_is_free?(@x_coord, new_y_coord)
            # if true, set new y_coord
            @y_coord = new_y_coord
          else
            # if false, just mark collision warning
            @collision_warn = true
          end
        end
      end

      # if collision_warn is false (movement is not halted), unmark coordinates on plateau
      plateau.unmark_tile_used(old_x_coord, old_y_coord)

      # mark hover current position as used
      plateau.mark_tile_used(@x_coord, @y_coord)

      # check if new coordinates are out of boundary
      @out_of_boundary = plateau.out_of_boundary?(@x_coord, @y_coord)

    end
  end

  private

  def move_on_x(type)
    return @x_coord + 1 if type == "add"
    return @x_coord - 1 if type == "subtract"
  end

  def move_on_y(type)
    return @y_coord + 1 if type == "add"
    return @y_coord - 1 if type == "subtract"
  end

end