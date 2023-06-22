# frozen_string_literal: true
# typed: true

require_relative '../../solution_base'
module Year2015
  class Day15 < SolutionBase
    def initialize
      input = File.read(File.join(File.dirname(__FILE__), 'input.txt'))
      super(input)
    end

    def part_one
      items = T.cast(data, T::Array[String]).map do |line|
        T.cast(line.scan(/-\d+|\d+/), T::Array[String]).map(&:to_i)
      end
      brute_force(items)
    end

    def brute_force(items)
      max = 100
      calcs = []
      (1..max - 3).each do |a|
        (1..max - a).each do |b|
          (1..max - a - b - 1).each do |c|
            sums = [a, b, c, max - a - b - c]
            calc = 1
            4.times do |i|
              sub_calc = 0
              items.each_with_index do |item, idx|
                sub_calc += item[i] * sums[idx]
              end
              calc = 0 if sub_calc.negative?
              calc *= sub_calc
            end
            calcs << calc
          end
        end
      end
      calcs.max
    end

    def part_two
      items = T.cast(data, T::Array[String]).map do |line|
        T.cast(line.scan(/-\d+|\d+/), T::Array[String]).map(&:to_i)
      end
      brute_force_with_calories(items)
    end

    def brute_force_with_calories(items)
      max = 100
      calcs = []
      (1..max - 3).each do |a|
        (1..max - a).each do |b|
          (1..max - a - b - 1).each do |c|
            sums = [a, b, c, max - a - b - c]

            calories = 0

            items.each_with_index do |item, idx|
              calories += item.last * sums[idx]
            end

            next unless calories == 500

            calc = 1
            4.times do |i|
              sub_calc = 0
              items.each_with_index do |item, idx|
                sub_calc += item[i] * sums[idx]
              end
              calc = 0 if sub_calc.negative?
              calc *= sub_calc
            end
            calcs << calc
          end
        end
      end
      calcs.max
    end
  end
end
