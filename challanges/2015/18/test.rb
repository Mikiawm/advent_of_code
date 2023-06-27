# frozen_string_literal: true
# typed: true

require 'minitest/autorun'
require_relative 'solution'

module Year2015
  # class Day18
  #   def initialize
  #     @input = ''
  #   end
  # end

  class TestDay18 < Minitest::Test
    def setup
      @day18 = Day18.new
    end

    def test_part_one
      assert_equal '', @day18.part_one
    end

    def test_part_two
      assert_equal '', @day18.part_two
    end
  end
end
