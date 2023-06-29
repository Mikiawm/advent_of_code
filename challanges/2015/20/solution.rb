# frozen_string_literal: true
# typed: true

require_relative '../../solution_base'
module Year2015
  class Day20 < SolutionBase
    def initialize
      input = File.read(File.join(File.dirname(__FILE__), 'input.txt'))
      super(input)
    end

    def get_dividors(n)
      (1..Math.sqrt(n)).each_with_object([]) { |i, arr| (n % i).zero? && arr << i && n / i != i && arr << n / i }
    end

    def part_one
      houses = {}
      cur_house = 1

      loop do
        dividors = get_dividors(cur_house)

        dividors.each do |dividor|
          houses[cur_house] = houses[cur_house].to_i + dividor * 10
        end
        return cur_house if houses[cur_house] >= 29_000_000

        cur_house += 1
      end
    end

    def part_two
      houses = {}
      cur_house = 1
      lst = 10_000_000
      elf = 1
      loop do
        (1..50).each do |idx|
          cur_house = idx * elf
          houses[cur_house] = houses[cur_house].to_i + elf * 11
          lst = cur_house if houses[cur_house] >= 29_000_000 && cur_house < lst
        end
        return lst if elf == 1_000_000

        elf += 1
      end
    end
  end
end
