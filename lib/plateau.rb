class Plateau

  attr_accessor :final_boundary_x, :final_boundary_y, :initial_boundary_x, :initial_boundary_y

  def initialize(f_boundary_x, f_boundary_y)
    @final_boundary_x = f_boundary_x
    @final_boundary_y = f_boundary_y

    # Always starts at "0,0"
    @initial_boundary_x = 0
    @initial_boundary_y = 0
  end

end