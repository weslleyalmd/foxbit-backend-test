require 'test/unit'
require_relative '../lib/hover.rb'
require_relative '../lib/plateau.rb'


class HoverTest < Test::Unit::TestCase

  def setup
    @plateau = Plateau.new(5, 5)
    @hover = Hover.new(0, 0, "N")
    @plateau.used_tiles = [[0, 0]]

    @hover_out_of_boundary = Hover.new(0, 4, "N")
    @hover_collision_halt = Hover.new(0, 3, "S")
    @instructions = "MMMR"
  end

  def test_current_position
    assert_equal @hover.current_position, "0 0 N\n"
  end

  def test_out_of_boundary
    @hover_out_of_boundary.move(@instructions, @plateau)
    assert_equal @hover_out_of_boundary.current_position, "0 7 E - Warning: This hover is out of boundary\n"
  end

  def test_collision_halt
    @hover_collision_halt.move(@instructions, @plateau)
    assert_equal @hover_collision_halt.current_position, "0 1 S - Collision Warning: hover movement halted\n"
  end

  def test_move
    @hover.move(@instructions, @plateau)
    assert_equal @hover.current_position, "0 3 E\n"
  end

end