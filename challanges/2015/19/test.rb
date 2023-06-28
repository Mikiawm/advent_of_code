# frozen_string_literal: true
# typed: true

require 'minitest/autorun'
require_relative 'solution'

module Year2015
  # class Day19
  #   def initialize
  #     @input = ''
  #   end
  # end

  class TestDay19 < Minitest::Test
    def setup
      @day19 = Day19.new
    end

    def test_part_one
      assert_equal '', @day19.part_one
    end

    def test_part_two
      assert_equal '', @day19.part_two
    end
  end
end
