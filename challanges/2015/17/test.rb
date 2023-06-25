# frozen_string_literal: true
# typed: true

require 'minitest/autorun'
require_relative 'solution'

module Year2015
  # class Day17
  #   def initialize
  #     @input = ''
  #   end
  # end

  class TestDay17 < Minitest::Test
    def setup
      @day17 = Day17.new
    end

    def test_part_one
      assert_equal '', @day17.part_one
    end

    def test_part_two
      assert_equal '', @day17.part_two
    end
  end
end
