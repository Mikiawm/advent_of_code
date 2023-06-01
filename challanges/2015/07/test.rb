# typed: true

require 'minitest/autorun'
require_relative 'solution'

module Year2015
  # class Day07
  #   def initialize
  #     @input = '123 -> x
  # 456 -> y
  # x AND y -> d
  # x OR y -> e
  # x LSHIFT 2 -> f
  # y RSHIFT 2 -> g
  # NOT x -> h
  # NOT y -> i'
  #   end
  # end

  class TestDay07 < Minitest::Test
    def setup
      @day07 = Day07.new
    end

    def test_part_one
      assert_equal '46065', @day07.part_one
    end

    def test_part_two
      assert_equal '14134', @day07.part_two
    end
  end
end
