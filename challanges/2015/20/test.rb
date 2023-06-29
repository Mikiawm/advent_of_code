# frozen_string_literal: true
# typed: true

require 'minitest/autorun'
require_relative 'solution'

module Year2015
  # class Day20
  #   def initialize
  #     @input = ''
  #   end
  # end

  class TestDay20 < Minitest::Test
    def setup
      @day20 = Day20.new
    end

    def test_part_one
      assert_equal '', @day20.part_one
    end

    def test_part_two
      assert_equal '', @day20.part_two
    end
  end
end
