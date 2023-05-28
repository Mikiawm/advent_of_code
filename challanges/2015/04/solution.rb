# frozen_string_literal: true
# typed: true

require 'digest'
require_relative '../../solution_base'
module Year2015
  class Day04 < SolutionBase
    def initialize
      input = File.read(File.join(File.dirname(__FILE__), 'input.txt'))
      super(input)
    end

    def part_one
      search_hexdigest('00000')
    end

    def part_two
      search_hexdigest('000000')
    end

    def search_hexdigest(start_str)
      index = 0
      loop do
        str = "#{data}#{index}"

        return index.to_s if T.cast(Digest::MD5.hexdigest(str), String).start_with?(start_str)

        index += 1
      end
    end
  end
end
