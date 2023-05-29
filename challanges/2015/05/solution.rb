# frozen_string_literal: true
# typed: true

require_relative '../../solution_base'
module Year2015
  class Day05 < SolutionBase
    def initialize
      input = File.read(File.join(File.dirname(__FILE__), 'input.txt'))
      super(input)
    end

    def part_one
      sum = 0
      (T.cast(data, T::Array[String]).each do |str|
        sum += 1 if count_vowels(str) >= 3 && check_duplicate(str) && !contains_banned_letters_comb(str)
      end)

      sum.to_s
    end

    def part_two
      sum = 0
      T.cast(data, T::Array[String]).each do |str|
        sum += 1 if check_duplicate_without_overlap(str) && check_letter_repeats(str)
      end
      sum.to_s
    end

    def count_vowels(str)
      str.count('aeiou')
    end

    def check_duplicate(str)
      T.cast(str, String).each_char.with_index do |ch, index|
        return true if str[index + 1] == ch
      end
      false
    end

    def check_duplicate_without_overlap(str)
      T.cast(str.chars, T::Array[String]).each_cons(2).with_index do |ch, index|
        from = str[(index + 2)..]
        return true if from && T.cast(from, String).include?(ch.join(''))
      end
      false
    end

    def check_letter_repeats(str)
      T.cast(str, String).each_char.with_index do |ch, index|
        return true if str[index + 2] == ch
      end
      false
    end

    # ab, cd, pq, or xy
    def contains_banned_letters_comb(str)
      %w[ab cd pq xy].any? { |word| T.cast(str, String).include?(word) }
    end
  end
end
