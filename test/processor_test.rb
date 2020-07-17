require 'test/unit'
require_relative '../lib/processor.rb'

class ProcessorTest < Test::Unit::TestCase

  def setup
    @processor = Processor.new(File.expand_path('test/resources/input_data.txt'))
    @processor.run
  end

  def test_plateau
    assert_not_nil @processor.plateau

    assert_equal @processor.plateau.final_boundary_x, 5
    assert_equal @processor.plateau.final_boundary_y, 5

    assert_equal @processor.plateau.hovers.size, 2
  end

end