# typed: true

require 'minitest/autorun'
require_relative 'solution'

module Year2015
  class TestDay03 < Minitest::Test
    def setup
      @day03 = Day03.new
    end

    def test_part_one
      assert_equal '2081', @day03.part_one
    end

    def test_part_two
      assert_equal '2341', @day03.part_two
    end
  end
end
