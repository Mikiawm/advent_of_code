# frozen_string_literal: true
# typed: true

class SolutionBase
  def self.part_one(input)
    new(*input).part1
  end

  def self.part_two(input)
    new(*input).part2
  end

  def initialize(input)
    @input = input
  end

  def data
    @data ||= begin
      processed = @input.lines(chomp: true).map do |line|
        process_input line
      end

      processed.length == 1 ? processed.first : process_dataset(processed)
    end
  end

  private

  def process_input(line)
    line
  end

  def process_dataset(set)
    set
  end
end
