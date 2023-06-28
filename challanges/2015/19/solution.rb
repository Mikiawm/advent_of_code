# frozen_string_literal: true
# typed: true

require_relative '../../solution_base'
module Year2015
  class Day19 < SolutionBase
    def initialize
      input = File.read(File.join(File.dirname(__FILE__), 'input.txt'))
      super(input)
    end

    def part_one
      molecules = ''
      replacements = Hash.new { |h, k| h[k] = [] }
      T.cast(data, T::Array[String]).each do |line|
        if line.include?('=>')
          item = line.split(' => ')
          replacements[item[0]] << item[1]
        elsif !line.empty?
          molecules = line
        end
      end

      str_arr = []

      replacements.each_key do |replacement|
        replacements[replacement].each do |_item|
          a = (0...molecules.length).find_all { |i| molecules[i, replacement.length] == replacement }
          a.each do |idx|
            temp = molecules.dup

            temp[idx, replacement.length] = _item
            str_arr << temp
          end
        end
      end

      str_arr.uniq.count
    end

    def part_two
      molecules = ''
      replacements = {}
      T.cast(data, T::Array[String]).each do |line|
        if line.include?('=>')
          item = line.split(' => ')
          replacements[item[1]] = item[0]
        elsif !line.empty?
          molecules = line
        end
      end
      step = 0
      while molecules != 'e'
        replacements.each_key do |key|
          next unless molecules.include? key

          molecules.sub!(key, replacements[key])
          step += 1
        end

      end
      step
    end
  end
end
