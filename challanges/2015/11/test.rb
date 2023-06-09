# frozen_string_literal: true
# typed: true

require 'minitest/autorun'
require_relative 'solution'

module Year2015
  class TestPassword < Minitest::Test
    def setup
      @password = Password.new('abcdffaa')
    end

    def test_check_straight_three_letters
      assert_equal true, @password.check_straight_three_letters
    end

    def test_check_not_containt_letters
      assert_equal true, @password.check_not_containt_letters
    end

    def test_check_straight_pairs
      assert_equal true, @password.check_straight_pairs
    end
  end

  class TestPassword2 < Minitest::Test
    def test_check_straight_three_letters
      @password = Password.new('abcdffaff')
      assert_equal true, @password.check_straight_three_letters
    end

    def test_check_not_containt_letters
      @password = Password.new('abcdffaff')
      assert_equal true, @password.check_not_containt_letters
    end

    def test_check_straight_pairs
      @password = Password.new('abcdffaff')
      assert_equal false, @password.check_straight_pairs
    end

    def test_password_increment
      @password = Password.new('aa')
      @password.increment
      assert_equal 'ab', @password.to_s
    end

    def test_password_incremen_20_times
      @password = Password.new('aa')

      20.times { |_| @password.increment }
      assert_equal 'au', @password.to_s
    end

    def test_password_incremen_30_times
      @password = Password.new('xx')

      4.times { |_| @password.increment }
      assert_equal 'yb', @password.to_s
    end
  end

  class TestDay11 < Minitest::Test
    def setup
      @day11 = Day11.new('abcdefgh')
    end

    def test_part_one
      assert_equal 'abcdffaa', @day11.part_one
    end

    def test_part_two
      @day11 = Day11.new('abcdffaa')
      assert_equal 'abcdffbb', @day11.part_one
    end
  end
end
