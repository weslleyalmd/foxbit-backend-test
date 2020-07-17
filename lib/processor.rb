require_relative 'plateau.rb'
require_relative 'hover.rb'

class Processor

  attr_accessor :file, :plateau

  def initialize(file_path)
    @file = read(file_path)
    @plateau = nil
  end

  def run
    final_boundary_x, final_boundary_y = file[0].split(" ")
    @plateau = Plateau.new(final_boundary_x, final_boundary_y)
    
    # remove plateau boundary coordinates
    @file.delete_at(0)

    # process instructions
    move_hovers(@file)

    print_hovers_positions
  end

  private

  def print_hovers_positions
    @plateau.hovers.map {|h| h.current_position}
  end

  def move_hovers(hovers)
    hovers.each_slice(2) do |initial_position, instructions|
      x_coord, y_coord, direction = initial_position.split(" ")
      hover = Hover.new(x_coord, y_coord, direction)
      hover.move(instructions)
      @plateau.hovers << hover
    end
  end

  def read(file_path)
    if File.exists? file_path
      return File.readlines(file_path, chomp: true) rescue nil
    else
      puts "The file path is invalid"
      return nil
    end
  end
end