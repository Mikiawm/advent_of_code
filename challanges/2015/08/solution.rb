# frozen_string_literal: true
# typed: true

require_relative '../../solution_base'
module Year2015
  class Day08 < SolutionBase
    def initialize
      input = File.read(File.join(File.dirname(__FILE__), 'input.txt'))
      super(input)
    end

    def part_one
      sum = 0
      T.cast(data, T::Array[String]).each do |str|
        special_char_length = str.scan(/(\\x[0-9a-fA-F]{2})|(\\")|(\\{2})/)

        reduces_str_length = str.gsub(/(\\x[0-9a-fA-F]{2})|(\\{2})|(\\")|"/, '').length

        # can be just eval(str).size
        sum += str.length - (special_char_length.length + reduces_str_length)
      end
      sum
    end

    def part_two
      sum = 0
      T.cast(data, T::Array[String]).each do |str|
        sum += str.inspect.size - str.size
      end
      sum
    end
  end
end
