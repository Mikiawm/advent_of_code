# frozen_string_literal: true
# typed: true

require_relative '../../solution_base'
require 'set'

module Year2015
  class Santa
    def initialize
      @x = 0
      @y = 0
    end

    def ==(other)
      self.class == other.class &&
        @x == other.x &&
        @y == other.y
    end

    def to_str
      "#{@x},#{@y}"
    end

    def <
      @x -= 1
      self
    end

    def >
      @x += 1
      self
    end

    def ^
      @y += 1
      self
    end

    def v
      @y -= 1
      self
    end
  end

  class Day03 < SolutionBase
    def initialize
      input = File.read(File.join(File.dirname(__FILE__), 'input.txt'))
      super(input)
    end

    def part_one
      santa = Santa.new
      s1 = Set[santa.to_str]
      T.cast(data, String).each_char do |ch|
        santa.send(ch)
        s1.add(santa.to_str)
      end
      s1.size.to_s
    end

    def part_two
      santa = Santa.new
      robo_santa = Santa.new
      s1 = Set[santa.to_str]
      T.cast(data, String).each_char.with_index do |ch, index|
        s1 << (index.even? ? santa.send(ch).to_str : robo_santa.send(ch).to_str)
      end
      s1.size.to_s
    end
  end
end
