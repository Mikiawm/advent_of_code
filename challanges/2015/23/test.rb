# frozen_string_literal: true
# typed: true

require 'minitest/autorun'
require_relative 'solution'

module Year2015
  # class Day23
  #   def initialize
  #     @input = ''
  #   end
  # end

  class TestDay23 < Minitest::Test
    def setup
      @day23 = Day23.new
    end

    def test_part_one
      assert_equal '', @day23.part_one
    end

    def test_part_two
      assert_equal '', @day23.part_two
    end
  end
end
