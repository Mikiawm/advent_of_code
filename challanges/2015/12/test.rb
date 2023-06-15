# frozen_string_literal: true
# typed: true

require 'minitest/autorun'
require_relative 'solution'

module Year2015
  # class Day12
  #   def initialize
  #     @input = ''
  #   end
  # end

  class TestDay12 < Minitest::Test
    def setup
      @day12 = Day12.new
    end

    def test_part_one
      assert_equal '111754', @day12.part_one
    end

    def test_part_two
      assert_equal '', @day12.part_two
    end
  end
end
