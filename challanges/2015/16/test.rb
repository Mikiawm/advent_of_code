# frozen_string_literal: true
# typed: true

require 'minitest/autorun'
require_relative 'solution'

module Year2015
  # class Day16
  #   def initialize
  #     @input = ''
  #   end
  # end

  class TestDay16 < Minitest::Test
    def setup
      @day16 = Day16.new
    end

    def test_part_one
      assert_equal '', @day16.part_one
    end

    def test_part_two
      assert_equal '', @day16.part_two
    end
  end
end
