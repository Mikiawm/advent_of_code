# frozen_string_literal: true
# typed: true

require_relative '../../solution_base'
module Year2015
  class Day17 < SolutionBase
    def initialize
      input = File.read(File.join(File.dirname(__FILE__), 'input.txt'))
      super(input)
    end

    def part_one
      sum = 0
      numbers_data = T.cast(data, T::Array[String]).map(&:to_i)
      (1...numbers_data.length).map { |i| numbers_data.combination(i).to_a }.flatten(1).each do |arr|
        sum += 1 if arr.sum == 150
      end
      sum
    end

    def part_two
      sum = {}
      numbers_data = T.cast(data, T::Array[String]).map(&:to_i)
      (1...numbers_data.length).map { |i| numbers_data.combination(i).to_a }.flatten(1).each do |arr|
        if arr.sum == 150
          sum[arr.length] ||= 0
          sum[arr.length] += 1
        end
      end
      sum[sum.keys.min]
    end
  end
end
