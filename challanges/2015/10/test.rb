# typed: true

require 'minitest/autorun'
require_relative 'solution'

module Year2015
  # class Day10
  #   def initialize
  #     @input = ''
  #   end
  # end

  class TestDay10 < Minitest::Test
    def setup
      @day10 = Day10.new
    end

    def test_part_one
      assert_equal 329_356, @day10.part_one
    end

    def test_part_two
      assert_equal 4_666_278, @day10.part_two
    end
  end
end
