# frozen_string_literal: true
# typed: true

require 'minitest/autorun'
require_relative 'solution'

module Year2015
  # class Day13
  #   def initialize
  #     @input = ''
  #   end
  # end

  class TestDay13 < Minitest::Test
    def setup
      @day13 = Day13.new
    end

    def test_part_one
      assert_equal '', @day13.part_one
    end

    def test_part_two
      assert_equal '', @day13.part_two
    end
  end
end
