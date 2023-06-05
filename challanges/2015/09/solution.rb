# frozen_string_literal: true
# typed: true

require_relative '../../solution_base'
module Year2015
  class Day09 < SolutionBase
    def initialize
      input = File.read(File.join(File.dirname(__FILE__), 'input.txt'))
      super(input)
    end

    def part_one
      distance_list.uniq.min.to_s
    end

    def part_two
      distance_list.uniq.max.to_s
    end

    def init
      distances = Hash.new { |h, k| h[k] = {} }
      T.cast(data, T::Array[String]).map(&:split).each do |x, _, y, _, v|
        distances[x][y] = v.to_i
        distances[y][x] = v.to_i
      end
      distances
    end

    def distance_list
      distances = init
      distances.keys.permutation.to_a.map do |perm|
        shortest = 0
        perm.each_cons(2) do |item|
          shortest += distances[item[0]][item[1]] unless distances[item[0]][item[1]].nil?
        end

        shortest
      end
    end
  end
end
