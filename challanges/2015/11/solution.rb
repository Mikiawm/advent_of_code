# frozen_string_literal: true
# typed: true

require_relative '../../solution_base'
module Year2015
  class Password
    def initialize(str)
      @str = T.let(T.cast(str, String).bytes, T::Array[Integer])
    end

    def to_s
      @str.pack('c*')
    end

    def increment
      cur = @str.length - 1
      loop do
        if (T.must(@str[cur]) + 1) > 122
          @str[cur] = 97
          cur -= 1
        else
          new_val = T.must(@str[cur]) + 1
          @str[cur] = new_val
          break
        end
      end
    end

    def check
      check_straight_three_letters && check_not_containt_letters && check_straight_pairs
    end

    def check_straight_three_letters
      @str.each_cons(3) do |a, b, c|
        return true if a == (T.must(b) - 1) && a == (T.must(c) - 2)
      end
      false
    end

    def check_not_containt_letters
      return true unless @str.include?('iol'.bytes)

      false
    end

    def check_straight_pairs
      cons = []
      @str.each_cons(2) do |a, b|
        cons.append([a, b]) if a == b
      end

      cons.length > 1 && cons.length == cons.to_set.length
    end
  end

  class Day11 < SolutionBase
    def initialize(input = 'hepxcrrq')
      super(input)
    end

    def part_one
      pass = Password.new(data)
      pass.increment

      pass.increment until pass.check

      pass.to_s
    end
  end
end
