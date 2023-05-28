# typed: true

require 'minitest/autorun'
require_relative 'solution'

module Year2015
  # class Day04
  #   def initialize
  #     @input = ''
  #   end
  # end

  class TestDay04 < Minitest::Test
    def setup
      @day04 = Day04.new
    end

    def test_part_one
      assert_equal '117946', @day04.part_one
    end

    def test_part_two
      assert_equal '3938038', @day04.part_two
    end
  end
end
