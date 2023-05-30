# typed: true

require 'minitest/autorun'
require_relative 'solution'

module Year2015
  # class Day06
  #   def initialize
  #     @input = 'turn on 0,0 through 999,999
  #     toggle 0,0 through 0,0
  #     toggle 0,0 through 0,0'
  #   end
  # end

  class TestDay06 < Minitest::Test
    def setup
      @day06 = Day06.new
    end

    def test_part_one
      assert_equal 400_410, @day06.part_one
    end

    def test_part_two
      assert_equal 15_343_601, @day06.part_two
    end
  end
end
