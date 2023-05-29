# typed: true

require 'minitest/autorun'
require_relative 'solution'

module Year2015
  # class Day05
  #   def initialize
  #     @input = ''
  #   end
  # end

  class TestDay05 < Minitest::Test
    def setup
      @day05 = Day05.new
    end

    def test_part_one
      assert_equal '258', @day05.part_one
    end

    def test_part_two
      assert_equal '53', @day05.part_two
    end
  end
end
