# typed: false

require 'minitest/autorun'
require_relative 'solution'

module Year2021
  class TestDay03 < Minitest::Test
    def setup
      @day03 = Day03.new('kokos')
    end

    def test_that_kitty_can_eat
      assert_equal 'OHAI!', @day03.part_1
    end
  end
end
