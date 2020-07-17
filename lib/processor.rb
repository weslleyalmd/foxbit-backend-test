require_relative 'plateau.rb'
require_relative 'hover.rb'

require 'byebug'
class Processor

  attr_accessor :file, :plateau, :hovers

  def initialize(file_path)
    @file = read(file_path)
  end

  def run
    final_boundary_x, final_boundary_y = file[0].split(" ")
    @plateau = Plateau.new(final_boundary_x, final_boundary_y)
    
    byebug
  end

  private

  def read(file_path)
    if File.exists? file_path
      return File.readlines(file_path, chomp: true) rescue nil
    else
      puts "The file path is invalid"
      return nil
    end
  end
end