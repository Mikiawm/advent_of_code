# frozen_string_literal: true
# typed: true

require_relative '../../solution_base'
module Year2015
  class Day24 < SolutionBase
    def initialize
      input = File.read(File.join(File.dirname(__FILE__), 'input.txt'))
      super(input)
    end

    def part_one
      split_packages(3)
    end

    def part_two
      split_packages(4)
    end

    def split_packages(split)
      possibles = {}
      first_group = T.let([], T::Array[Array])
      numeric_data = T.cast(data, T::Array[String]).map(&:to_i)
      target_sum = numeric_data.sum / split

      (0..numeric_data.length).each do |n|
        numeric_data.combination(n) do |arr|
          first_group << arr if arr.sum == target_sum
        end
        break if first_group.any?
      end

      quantum_entanglement = T.let(2**(0.size * 8 - 2) - 1, Numeric)

      first_group.each do |arr|
        next if arr.inject(:*) >= quantum_entanglement

        second_pool = numeric_data - arr

        (0..second_pool.length).each do |n|
          second_pool.combination(n) do |arr2|
            next if arr2.sum != target_sum

            if split == 3
              quantum_entanglement = arr.inject(:*)
              next
            end

            third_pool = second_pool - arr2

            (0..third_pool.length).each do |n1|
              third_pool.combination(n1) do |arr3|
                quantum_entanglement = arr.inject(:*) if arr3.sum == target_sum
              end
            end
          end
        end
      end
      quantum_entanglement
    end
  end
end
