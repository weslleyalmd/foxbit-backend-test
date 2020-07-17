require 'test/unit'
require_relative '../lib/hover.rb'

class HoverTest < Test::Unit::TestCase

  def setup
    @hover = Hover.new(0, 0, "N")
    @instructions = "MMMR"
  end

  def test_current_position
    assert_equal @hover.current_position, "0 0 N\n"
  end

  def test_move
    @hover.move(@instructions)
    assert_equal @hover.current_position, "0 3 E\n"
  end

end