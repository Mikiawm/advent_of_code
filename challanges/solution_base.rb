# frozen_string_literal: true
# typed: strict

require('sorbet-runtime')

class SolutionBase
  extend T::Sig

  sig { params(input: String).void }
  def initialize(input)
    @input = input
  end

  sig { returns(T.any(T::Array[String], String)) }
  def data
    @data ||= T.let(begin
      processed = @input.lines(chomp: true).map do |line|
        process_input line
      end

      T.must(processed.length == 1 ? processed.first : process_dataset(processed))
    end, T.nilable(T.any(T::Array[String], String)))
  end

  private

  sig { params(line: String).returns(String) }
  def process_input(line)
    line
  end

  sig { params(set: T::Array[String]).returns(T::Array[String]) }
  def process_dataset(set)
    set
  end
end
