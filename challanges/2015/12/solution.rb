# frozen_string_literal: true
# typed: true

require 'json'

require_relative '../../solution_base'
module Year2015
  class Day12 < SolutionBase
    def initialize
      input = File.read(File.join(File.dirname(__FILE__), 'input.txt'))
      super(input)
    end

    def part_one
      sum = 0
      T.cast(data, String).scan(/-\d+|\d+/).each do |item|
        sum += T.cast(item, String).to_i
      end

      sum
    end

    def part_two
      parsed_data = JSON.parse(T.cast(data, String))

      each_hash(parsed_data)
    end

    def each_hash(hash)
      sum = 0
      hash.each_key do |key|
        case hash[key].class.to_s
        when 'Hash'
          sum += each_hash(hash[key])
        when 'Array'
          sum += each_array(hash[key])
        when 'Integer'
          sum += hash[key]
        when 'String'
          if hash[key] == 'red'
            sum = 0
            break
          end
        end
      end
      sum
    end

    def each_array(arr)
      sum = 0
      T.cast(arr, T::Array[Object]).each do |item|
        case item.class.to_s
        when 'Hash'
          sum += each_hash(item)
        when 'Array'
          sum += each_array(item)
        when 'Integer'
          sum += T.cast(item, Integer)
        when 'String'
        end
      end
      sum
    end
  end
end
