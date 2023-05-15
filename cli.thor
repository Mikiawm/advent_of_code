#typed: true

require_relative "cli_commands/init"
require_relative "cli_commands/submit"
require_relative "cli_commands/eval"

class Error < StandardError; end
class MissingCookieError < Error; end
class InvalidDayError < Error; end
class CLI < Thor
  desc "example", "an example task"
  def example
    puts "I'm a thor task!"
  end

  desc "download INPUT", "download your input for day and year"
  option :day, default: Time.now.day.to_s
  option :year, default: Time.now.year.to_s
  def init()
    Init.new(options[:day].to_i, options[:year].to_i).execute
  rescue InvalidDayError
    say "Error: The day argument must be an integer between 1 and 25.", :red
  rescue MissingCookieError
    say "Error: Cannot find cookie in the AOC_COOKIE environment variable.", :red
  end

  desc "submit PUZZLE", "solve the selected part of the puzzle for the day of the year"
  option :day, default: Time.now.day.to_s
  option :year, default: Time.now.year.to_s
  option :part, default: "1"
  def submit()
    Submit.new(options[:year], options[:day], options[:part])
  rescue InvalidDayError
    say "Error: The day argument must be an integer between 1 and 25.", :red
  rescue MissingCookieError
    say "Error: Cannot find cookie in the AOC_COOKIE environment variable.", :red
  end

  desc "eval PUZZLE", "get answer and run tests if there are any the selected part of the puzzle for the day of the year"
  option :day, default: Time.now.day.to_s
  option :year, default: Time.now.year.to_s
  option :part, default: "one"
  def eval()
    Eval.new(options[:year], options[:day], options[:part])
  rescue InvalidDayError
    say "Error: The day argument must be an integer between 1 and 25.", :red
  rescue MissingCookieError
    say "Error: Cannot find cookie in the AOC_COOKIE environment variable.", :red
  end
end

