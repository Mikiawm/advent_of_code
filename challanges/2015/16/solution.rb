# frozen_string_literal: true
# typed: true

require_relative '../../solution_base'
module Year2015
  class Day16 < SolutionBase
    AUNT = T.let({
                   "children": 3,
                   "cats": 7,
                   "samoyeds": 2,
                   "pomeranians": 3,
                   "akitas": 0,
                   "vizslas": 0,
                   "goldfish": 5,
                   "trees": 3,
                   "cars": 2,
                   "perfumes": 1
                 }, Hash)
    def initialize
      input = File.read(File.join(File.dirname(__FILE__), 'input.txt'))
      super(input)
    end

    def part_one
      aunts = aunts_hash
      aunts.each_key do |key|
        correct = T.let(true, T::Boolean)
        aunts[key].each_key do |key2|
          if aunts[key][key2] != AUNT[key2.to_sym]
            correct = false
            break
          end
        end
        return key if correct
      end
    end

    def part_two
      aunts = aunts_hash

      aunts.each_key do |key|
        correct = T.let(true, T::Boolean)
        aunts[key].each_key do |key2|
          # greater than
          if %w[cats trees].include?(key2)
            if aunts[key][key2] <= AUNT[key2.to_sym]
              correct = false
              break
            end
          # fewer than
          elsif %w[pomeranians goldfish].include?(key2)
            if aunts[key][key2] >= AUNT[key2.to_sym]
              correct = false
              break
            end
          elsif aunts[key][key2] != AUNT[key2.to_sym]
            correct = false
            break
          end
        end
        return key if correct
      end
    end

    def aunts_hash
      aunts = Hash.new { |h, k| h[k] = {} }
      T.cast(data, T::Array[String]).each do |line|
        aunt = ''
        line.split(' ').each_slice(2).with_index do |pair, idx|
          if idx.zero?
            aunt = T.must(pair[0]) + T.must(pair[1]).chop
            aunts[aunt] = {}
          else
            aunts[aunt][T.must(pair[0]).chop] = T.must(pair[1]).to_i
          end
        end
      end
      aunts
    end
  end
end
