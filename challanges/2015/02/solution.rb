# frozen_string_literal: true
# typed: true

require_relative '../../solution_base'
module Year2015
  class Day02 < SolutionBase
    def initialize
      input = File.read(File.join(File.dirname(__FILE__), 'input.txt'))
      super(input)
    end

    def part_one
      (T.cast(data, T::Array[String]).map do |item|
         sides = item.split('x').map(&:to_i).combination(2).map do |comb|
           comb.inject(:*)
         end
         sides.sum * 2 + sides.min
       end).sum.to_s
    end

    def part_two
      (T.cast(data, T::Array[String]).map do |item|
        sides = T.must(item.split('x').map(&:to_i))

        sides.inject(:*) + (sides.min(2).map do |n|
          T.must(n) * 2
        end).sum
      end).sum.to_s
    end
  end
end
