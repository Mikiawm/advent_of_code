# typed: true

require 'minitest/autorun'
require_relative 'solution'

module Year2015
  # class Day09
  #   def initialize
  #     @input = ''
  #   end
  # end

  class TestDay09 < Minitest::Test
    def setup
      @day09 = Day09.new
    end

    def test_part_one
      assert_equal '251', @day09.part_one
    end

    def test_part_two
      assert_equal '898', @day09.part_two
    end
  end
end
