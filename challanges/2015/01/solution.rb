# frozen_string_literal: true
# typed: true

require_relative '../../solution_base'
module Year2015
  class Day01 < SolutionBase
    extend T::Sig
    def initialize
      super(File.read(File.join(File.dirname(__FILE__), 'input.txt')))
    end

    def part_one
      return unless data.is_a?(String)

      ((data.count ')') - (data.count '(')).abs.to_s
    end

    def part_two
      return unless data.is_a?(String)

      sum = 0

      T.cast(data, String).each_char.with_index(1) do |char, i|
        char == '(' ? sum += 1 : sum -= 1

        return i.to_s if sum.negative?
      end
    end
  end
end
