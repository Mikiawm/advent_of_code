# typed: true

require 'net/http'
require 'uri'

class Scaffold
  include Thor::Base

  def initialize(day, year)
    @day = day
    @year = year
  end

  def execute
    raise MissingCookieError unless cookie_present? && cookie

    say('Fetching input...')
    input = fetch_input

    unless Dir.exist?('challanges')
      say('Creating challanges directory...')
      Dir.mkdir('challanges')
    end

    unless Dir.exist?("challanges/#{@year}")
      say('Creating year directory...')
      Dir.mkdir("challanges/#{@year}")
    end

    unless Dir.exist?("challanges/#{@year}/#{day_string}")
      say('Creating day directory...')
      Dir.mkdir("challanges/#{@year}/#{day_string}")
    end

    unless File.exist?(solution_file_name)
      say("Creating file: #{solution_file_name}...")
      create_file(solution_file_name, solution_file_contents)
    end

    unless File.exist?(test_file_name)
      say("Creating file: #{test_file_name}...")
      create_file(test_file_name, test_file_contents)
    end

    say("Writing input to #{input_file_name}...")
    create_file(input_file_name, input)

    say('Done!', :green)
  end

  private

  def cookie
    @cookie ||= ENV['AOC_COOKIE']
    # @cookie ||= ENV.fetch('AOC_COOKIE', nil)
  end

  def cookie_present?
    ENV.key?('AOC_COOKIE')
  end

  def fetch_input
    url = URI("https://adventofcode.com/#{@year}/day/#{@day}/input")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request['Cookie'] = "session=#{cookie}"

    request['User-Agent'] = 'github.com/mikiawm'

    response = https.request(request)
    response.read_body
  end

  def create_file(file_name, contents = nil)
    File.open(file_name, 'w') do |file|
      file.puts contents if contents
    end
  end

  def input_file_name
    "challanges/#{@year}/#{day_string}/input.txt"
  end

  def day_string
    @day < 10 ? "0#{@day}" : @day.to_s
  end

  def solution_file_contents
    <<~RUBY
      # frozen_string_literal: true
        module Year#{@year}
          module Day#{day_string}
            class << self
              def part_one(input)
                raise NotImplementedError
              end

              def part_two(input)
                raise NotImplementedError
              end
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

  def solution_file_name
    "challanges/#{@year}/#{day_string}/solution.rb"
  end

  def test_file_name
    "challanges/#{@year}/#{day_string}/test.rb"
  end
end
