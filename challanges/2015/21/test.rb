# frozen_string_literal: true
# typed: true

require 'minitest/autorun'
require_relative 'solution'

module Year2015
  # class Day21
  #   def initialize
  #     @input = ''
  #   end
  # end

  class TestDay21 < Minitest::Test
    def setup
      @day21 = Day21.new
    end

    def test_part_one
      assert_equal '', @day21.part_one
    end

    def test_part_two
      assert_equal '', @day21.part_two
    end
  end
end
