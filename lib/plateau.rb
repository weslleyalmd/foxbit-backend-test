require 'byebug'
class Plateau

  attr_accessor :hovers, :used_tiles, :final_boundary_x, :final_boundary_y, :initial_boundary_x, :initial_boundary_y

  def initialize(f_boundary_x, f_boundary_y)
    @final_boundary_x = f_boundary_x.to_i
    @final_boundary_y = f_boundary_y.to_i

    # Always starts at "0,0"
    @initial_boundary_x = 0
    @initial_boundary_y = 0

    @hovers = []
    @used_tiles = []
  end

  def mark_tile_used(hover_x_coord, hover_y_coord)
    @used_tiles << [hover_x_coord, hover_y_coord]
  end

  def unmark_tile_used(hover_x_coord, hover_y_coord)
    @used_tiles -= [[hover_x_coord, hover_y_coord]]
  end

  def tile_is_free?(hover_x_coord, hover_y_coord)
    @used_tiles.select{ |t| t == [hover_x_coord, hover_y_coord] }.empty?
  end

  def out_of_boundary?(hover_x_coord, hover_y_coord)
    if hover_x_coord < initial_boundary_x || hover_x_coord > final_boundary_x || hover_y_coord < initial_boundary_y || hover_y_coord > final_boundary_y
       return true
     else
      return false
    end
  end

end