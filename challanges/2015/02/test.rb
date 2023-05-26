# typed: true

require 'minitest/autorun'
require_relative 'solution'

module Year2015
  class TestDay02 < Minitest::Test
    def setup
      @day02 = Day02.new
    end

    def test_part_one
      assert_equal '1586300', @day02.part_one
    end

    def test_part_two
      assert_equal '3737498', @day02.part_two
    end
  end
end
