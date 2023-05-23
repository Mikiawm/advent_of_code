# typed: true

require 'minitest/autorun'
require_relative 'solution'

module Year2016
  class TestDay01 < Minitest::Test
    def setup
      input = ""
      @day01 = Day01.new(input)
    end

    def test_part_one
      assert_equal '', @day01.part_one
    end

    def test_part_two
      assert_equal '', @day01.part_two
    end
  end
end
