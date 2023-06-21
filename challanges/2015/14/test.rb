# frozen_string_literal: true
# typed: true

require 'minitest/autorun'
require_relative 'solution'

module Year2015
  # class Day14
  #   def initialize
  #     @input = ''
  #   end
  # end

  class TestDay14 < Minitest::Test
    def setup
      @day14 = Day14.new
    end

    def test_part_one
      assert_equal '', @day14.part_one
    end

    def test_part_two
      assert_equal '', @day14.part_two
    end
  end
end
