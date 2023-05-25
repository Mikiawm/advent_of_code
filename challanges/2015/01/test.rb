# typed: true

require 'minitest/autorun'
require_relative 'solution'

module Year2015
  class TestDay01 < Minitest::Test
    def setup
      @day01 = Day01.new
    end

    def test_part_one
      assert_equal '232', @day01.part_one
    end

    def test_part_two
      assert_equal '1783', @day01.part_two
    end
  end
end
