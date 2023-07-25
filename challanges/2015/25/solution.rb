# frozen_string_literal: true
# typed: true

require_relative '../../solution_base'
module Year2015
  class Day25 < SolutionBase
    def initialize
      input = File.read(File.join(File.dirname(__FILE__), 'input.txt'))
      super(input)
    end

    def part_one
      code = 20_151_125
      row = 2981
      col = 3075

      current_deep = row + col - 1

      (2..current_deep).each do |n|
        n.times do |i|
          code = (code * 252_533) % 33_554_393

          return code if n == current_deep && i + 1 == col
        end
      end
    end

    def part_two
      raise NotImplementedError
    end
  end
end
