# typed: true

require 'minitest/autorun'
require_relative 'solution'

module Year2015
  # class Day08
  #   def initialize
  #     @input = ''
  #   end
  # end

  class TestDay08 < Minitest::Test
    def setup
      @day08 = Day08.new
    end

    def test_part_one
      assert_equal '1350', @day08.part_one.to_s
    end

    def test_part_two
      assert_equal '2085', @day08.part_two.to_s
    end
  end
end
