# frozen_string_literal: true
# typed: true

require 'json'

require_relative '../../solution_base'
class String
  def numeric?
    !Float(self).nil?
  rescue StandardError
    false
  end
end

module Year2015
  class Day07 < SolutionBase
    def initialize
      input = File.read(File.join(File.dirname(__FILE__), 'input.txt'))
      super(input)
    end

    def part_one
      @grades = {}
      load_grades
      get_value('a')
    end

    def part_two
      @grades = {}
      load_grades

      val_a = get_value('a')
      load_grades

      @grades['b'] = val_a
      p get_value('a')
    end

    def load_grades
      T.cast(data, T::Array[String]).each do |str|
        logic, variable = str.split('->').map(&:strip)
        @grades[variable] = logic
      end
    end

    def get_value(key)
      return key if key.numeric?

      @grades[key] = get_from(T.must(@grades[key]).strip.split)
    end

    def get_from(logic)
      return get_value(logic[0]) if logic.length == 1
      return not_bitwise(logic[1]) if logic[0] == 'NOT'
      return and_bitwise(logic[0], logic[2]) if logic[1] == 'AND'
      return or_bitwise(logic[0], logic[2]) if logic[1] == 'OR'
      return lshift_bitwise(logic[0], logic[2]) if logic[1] == 'LSHIFT'
      return rshift_bitwise(logic[0], logic[2]) if logic[1] == 'RSHIFT'
    end

    def not_bitwise(val)
      temp = get_value(val).to_i
      (~temp).to_s
    end

    def and_bitwise(first, second)
      (get_value(first).to_i & get_value(second).to_i).to_s
    end

    def or_bitwise(first, second)
      (get_value(first).to_i | get_value(second).to_i).to_s
    end

    def lshift_bitwise(first, second)
      (get_value(first).to_i << get_value(second).to_i).to_s
    end

    def rshift_bitwise(first, second)
      (get_value(first).to_i >> get_value(second).to_i).to_s
    end
  end
end
