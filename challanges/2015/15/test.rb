# frozen_string_literal: true
# typed: true

require 'minitest/autorun'
require_relative 'solution'

module Year2015
  # class Day15
  #   def initialize
  #     @input = ''
  #   end
  # end

  class TestDay15 < Minitest::Test
    def setup
      @day15 = Day15.new
    end

    def test_part_one
      assert_equal '', @day15.part_one
    end

    def test_part_two
      assert_equal '', @day15.part_two
    end
  end
end
