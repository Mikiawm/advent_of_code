# typed: true

require 'minitest/autorun'
require_relative 'solution'

module Year2021
  class TestDay03 < Minitest::Test
    def setup
      @day03 = Day03.new('kokos')
    end

    def test_part_one
      assert_equal 'OHAI!', @day03.part_one
    end

    def test_part_two
      assert_equal 'OHAI!', @day03.part_two
    end
  end
end
