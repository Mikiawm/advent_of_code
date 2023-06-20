# frozen_string_literal: true
# typed: true

require_relative '../../solution_base'
module Year2015
  class Day13 < SolutionBase
    def initialize
      input = File.read(File.join(File.dirname(__FILE__), 'input.txt'))
      super(input)
    end

    def part_one
      hash = Hash.new { |h, k| h[k] = {} }
      T.cast(data, T::Array[String]).map(&:split).each do |line|
        hash[line[0]][T.must(line[10]).chop] = line[2] == 'gain' ? line[3].to_i : -line[3].to_i
      end

      distances(hash).max
    end

    def part_two
      hash = Hash.new { |h, k| h[k] = {} }
      T.cast(data, T::Array[String]).map(&:split).each do |line|
        hash[line[0]][T.must(line[10]).chop] = line[2] == 'gain' ? line[3].to_i : -line[3].to_i
      end

      new_hash = {}

      hash.each_key do |key|
        new_hash[key] = 0
      end

      hash['me'] = new_hash

      distances(hash).max
    end

    def distances(hash)
      hash.keys.permutation.to_a.map do |perm|
        shortest = 0
        perm.each_cons(2) do |item|
          shortest += hash[item[0]][item[1]] unless hash[item[0]][item[1]].nil?
          shortest += hash[item[1]][item[0]] unless hash[item[1]][item[0]].nil?
        end

        shortest += hash[perm.last][perm.first] unless hash[perm.last][perm.first].nil?
        shortest += hash[perm.first][perm.last] unless hash[perm.first][perm.last].nil?
        shortest
      end
    end
  end
end
