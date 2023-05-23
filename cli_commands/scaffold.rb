# typed: true

require_relative('command')
require_relative('aoc_api')

class Scaffold
  include Thor::Base
  include Command

  def initialize(day, year)
    @day = day
    @year = year
  end

  def execute
    # raise MissingCookieError unless cookie_present? && cookie

    say('Fetching input...')
    input = AocApi.get_input(@year, @day, cookie)

    create_challanges_directory
    create_year_directory
    create_day_directory
    create_input_file(input)
    create_soultion_file
    create_test_file

    say('Done!', :green)
  end

  def create_challanges_directory
    return if Dir.exist?('challanges')

    say('Creating challanges directory...')
    Dir.mkdir('challanges')
  end

  def create_year_directory
    return if Dir.exist?("challanges/#{@year}")

    say('Creating year directory...')
    Dir.mkdir("challanges/#{@year}")
  end

  def create_day_directory
    return if Dir.exist?("challanges/#{@year}/#{day_string}")

    say('Creating day directory...')
    Dir.mkdir("challanges/#{@year}/#{day_string}")
  end

  def create_soultion_file
    return if File.exist?(solution_file_name)

    say("Creating file: #{solution_file_name}...")
    create_file(solution_file_name, solution_file_contents)
  end

  def create_input_file(input)
    say("Writing input to #{input_file_name}...")
    create_file(input_file_name, input)
  end

  def create_test_file
    return if File.exist?(test_file_name)

    say("Creating file: #{test_file_name}...")
    create_file(test_file_name, test_file_contents)
  end

  def create_file(file_name, contents = nil)
    File.open(file_name, 'w') do |file|
      file.puts contents if contents
    end
  end

  def solution_file_contents
    <<~RUBY
      # frozen_string_literal: true

      require_relative '../solution_base'
      module Year #{@year}
        class Day #{day_string} < SolutionBase
          def part_one
            p input
          end

          def part_two
            raise NotImplementedError
          end
        end
      end
    RUBY
  end

  def test_file_contents
    <<~RUBY
      # typed: true

      require 'minitest/autorun'
      require_relative 'solution'

      module Year#{@year}
        class TestDay#{day_string} < Minitest::Test
          def setup
            input = ""
            @day#{day_string} = Day#{day_string}.new(input)
          end

          def test_part_one
            assert_equal '', @day#{day_string}.part_one
          end

          def test_part_two
            assert_equal '', @day#{day_string}.part_two
          end
        end
      end
    RUBY
  end
end
