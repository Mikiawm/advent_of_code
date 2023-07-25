# frozen_string_literal: true
# typed: true

require 'minitest/autorun'
require_relative 'solution'

module Year2015
  # class Day25
  #   def initialize
  #     @input = ''
  #   end
  # end

  class TestDay25 < Minitest::Test
    def setup
      @day25 = Day25.new
    end

    def test_part_one
      assert_equal '', @day25.part_one
    end

    def test_part_two
      assert_equal '', @day25.part_two
    end
  end
end
