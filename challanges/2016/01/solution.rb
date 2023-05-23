# frozen_string_literal: true
# typed: true

require_relative '../../solution_base'
module Year2016
  class Day01 < SolutionBase
    def initialize
      input = File.read(File.join(File.dirname(__FILE__), 'input.txt'))
      super(input)
    end

    def part_one
      p @input
    end

    def part_two
      raise NotImplementedError
    end
  end
end
