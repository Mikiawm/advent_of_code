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
      friends = Hash.new { |h, k| h[k] = {} }
      T.cast(data, T::Array[String]).map(&:split).each do |line|
        friends[line[0]][T.must(line[10]).chop] = line[2] == 'gain' ? line[3].to_i : -line[3].to_i
      end

      distances(friends).max
    end

    def part_two
      friends = Hash.new { |h, k| h[k] = {} }
      T.cast(data, T::Array[String]).map(&:split).each do |line|
        friends[line[0]][T.must(line[10]).chop] = line[2] == 'gain' ? line[3].to_i : -line[3].to_i
      end

      me = {}

      friends.each_key do |key|
        me[key] = 0
      end

      friends['me'] = me

      distances(friends).max
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
