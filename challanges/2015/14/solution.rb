# frozen_string_literal: true
# typed: true

require_relative '../../solution_base'
module Year2015
  class Day14 < SolutionBase
    def initialize
      input = File.read(File.join(File.dirname(__FILE__), 'input.txt'))
      super(input)
    end

    def part_one
      time = 2503
      sums = T.cast(data, T::Array[String]).map(&:split).map do |line|
        speed = line[3].to_i
        last = line[6].to_i
        rest = line[13].to_i
        elapses = last + rest
        distance_from_repeats = time / elapses * last * speed
        distance_from_rest = time % elapses > last ? last * speed : (time % elapses) * speed

        distance_from_repeats + distance_from_rest
      end.max
    end

    class Reindeer
      attr_reader :value, :lead_value

      def initialize(name, speed, last, rest)
        @name = name
        @speed = speed
        @last = last
        @rest = rest
        @value = 0
        @lead_value = 0
      end

      def increment(time)
        @value += @speed if time % (@last + @rest) < @last
      end

      def increment_leader
        @lead_value += 1
      end

      def self.fastest(reindeers)
        reindeers.max_by(&:value)
      end

      def self.leader(reindeers)
        reindeers.max_by(&:lead_value)
      end
    end

    def part_two
      reindeers = T.cast(data, T::Array[String]).map(&:split).map do |line|
        Reindeer.new(line[0], line[3].to_i, line[6].to_i, line[13].to_i)
      end

      2503.times do |cur|
        reindeers.each do |reindeer|
          reindeer.increment(cur)
        end
        Reindeer.fastest(reindeers).increment_leader
      end

      p Reindeer.leader(reindeers).lead_value
    end
  end
end
