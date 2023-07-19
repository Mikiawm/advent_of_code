# frozen_string_literal: true
# typed: true

require 'minitest/autorun'
require_relative 'solution'

module Year2015
  # class Day22
  #   def initialize
  #     @input = ''
  #   end
  # end

  class TestDay22 < Minitest::Test
    def setup
      @day22 = Day22.new
    end

    def test_part_one
      assert_equal '', @day22.part_one
    end

    def test_part_two
      assert_equal '', @day22.part_two
    end
  end
end
