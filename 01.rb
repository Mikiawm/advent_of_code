#typed: strict

require("sorbet-runtime")

module Day01
  class << self
    extend T::Sig

    sig { params(input: T::Array[String]).returns(Integer) }
    def part_one(input)

      return 0
    end

    sig { params(input: T::Array[String]).returns(Integer) }
    def part_two(input)
      raise NotImplementedError
    end
  end
end
