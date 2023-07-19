# frozen_string_literal: true
# typed: true

require_relative '../../solution_base'
module Year2015
  class Day23 < SolutionBase
    def initialize
      input = File.read(File.join(File.dirname(__FILE__), 'input.txt'))
      super(input)
    end

    def part_one
      i = 0
      reg = {
        'a' => 0, # part_two set a to 1
        'b' => 0
      }
      loop do
        break if i >= data.length

        i += process(T.must(data[i]).split, reg)
      end
      p reg
    end

    def process(instruction, reg)
      i = 1
      case instruction[0]
      when 'inc'
        reg[instruction[1]] += 1
      when 'tpl'
        reg[instruction[1]] *= 3
      when 'hlf'
        reg[instruction[1]] /= 2
      when 'jmp'
        i = instruction[1].to_i
      when 'jie'
        i = instruction[2].to_i if reg[T.must(instruction[1]).chop].even?
      when 'jio'
        i = instruction[2].to_i if reg[T.must(instruction[1]).chop] == 1
      end

      i
    end

    def part_two
      raise NotImplementedError
    end
  end
end
