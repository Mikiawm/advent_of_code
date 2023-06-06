# frozen_string_literal: true
# typed: true

require_relative '../../solution_base'
module Year2015
  class Day10 < SolutionBase
    def initialize
      input = '3113322113'
      super(input)
    end

    def part_one
      # generate_nth_row(40, '3113322113')
      generate_nth_row_chunk_solution(40, '3113322113')
    end

    def part_two
      # generate_nth_row(50, '3113322113')
      generate_nth_row_chunk_solution(50, '3113322113')
    end

    def generate_nth_row_chunk_solution(times, input)
      dict = {}
      data_temp = input
      times.times do
        groups = T.cast(data_temp, String).each_char.chunk_while { |curr, nxt| curr == nxt }.map(&:join)
        new_str = []
        groups.each do |group|
          if dict.key?(group)
            new_str << dict[group]
          else
            dict[group] = group.length.to_s + (group[0]).to_s
            new_str << dict[group]
          end
        end

        data_temp = new_str.join
      end

      data_temp.length
    end

    def generate_nth_row(times, input)
      prev = input
      (0..times - 1).each do |_|
        i = 0
        new_str = []
        while i < prev.length
          count = 1
          j = i + 1
          cur = prev[i]
          while j < prev.length
            break unless prev[j] == cur

            count += 1
            j += 1
            i += 1
          end
          i += 1

          new_str << (count.to_s + cur)

        end

        prev = new_str.join
      end
      prev.length
    end
  end
end
