# frozen_string_literal: true
# typed: true

require 'minitest/autorun'
require_relative 'solution'

module Year2015
  # class Day24
  #   def initialize
  #     @input = ''
  #   end
  # end

  class TestDay24 < Minitest::Test
    def setup
      @day24 = Day24.new
    end

    def test_part_one
      assert_equal '', @day24.part_one
    end

    def test_part_two
      assert_equal '', @day24.part_two
    end
  end
end
