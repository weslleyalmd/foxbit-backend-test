require 'test/unit'
require_relative '../lib/plateau.rb'

class PlateauTest < Test::Unit::TestCase

  def setup
    @plateau = Plateau.new(5, 5)
    @plateau.mark_tile_used(1, 1)
  end

  def test_mark_tile_used
    @plateau.mark_tile_used(1, 2)
    assert_equal @plateau.used_tiles, [[1, 1], [1, 2]]
  end

  def test_tile_is_free?
    assert_equal @plateau.tile_is_free?(0, 3), true 
    assert_equal @plateau.tile_is_free?(1, 1), false 
  end

  def test_out_of_boundary?
    assert_equal @plateau.out_of_boundary?(10, 5), true
    assert_equal @plateau.out_of_boundary?(-1, -5), true
    assert_equal @plateau.out_of_boundary?(5, 5), false
  end

  def test_unmark_tile_used
    plateau = Plateau.new(5, 5)
    plateau.mark_tile_used(1, 1)
    plateau.unmark_tile_used(1, 1)
    assert_equal plateau.used_tiles, []
  end
end