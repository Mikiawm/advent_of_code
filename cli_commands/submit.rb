#typed: true
class Submit
  def initialize(year, day, part)
    @year = year
    @day = day
    @part = part

    submit_answer
  end


  def submit_answer
    load(solution_file_name)

    challange = Object.const_get("Year2021").const_get("Day03").new

    p @part
    part = (@part == "1") ? "part_one" : "part_two"
    answer = challange.send(part);

    p answer

    # response = WebClient.submit(2022, 24, 1, answer, cookie)

    # p response
    # wrong = /not the right answer/.match?(response.body)
    # already_complete = /Did you already complete it/.match?(response.body)
    # waiting_regex = /You have (\d*m* *\d+s) left to wait/
    # waiting = waiting_regex.match?(response.body)

    # puts "That's not the right answer" if wrong
    # puts "You have already completed this challenge" if already_complete

    # puts response.body[waiting_regex] if waiting

    # puts "Correct" if !wrong && !already_complete && !waiting
  end


  def cookie
    @cookie ||= ENV.fetch("AOC_COOKIE", nil)
  end

  def solution_file_name
    "challanges/#{@year}/#{day_string}/solution.rb"
  end

  def day_string
    @day.to_i < 10 ? "0#{@day}" : @day.to_s
  end
end

require "httparty"

  class WebClient
    include HTTParty

    base_uri "https://adventofcode.com"

    def self.get_input(year, day, session_cookie)
      get(
        "/#{year}/day/#{day}/input",
        headers: cookie_header(session_cookie)
      )
    end

    def self.submit(year, day, part, answer, session_cookie)
      post(
        "/#{year}/day/#{day}/answer",
        body: {
          level: part,
          answer: answer
        },
        headers: cookie_header(session_cookie)
      )
    end

    def self.cookie_header(session_cookie)
      cookie_hash = HTTParty::CookieHash.new
      cookie_hash.add_cookies(session: session_cookie)
      { "Cookie" => cookie_hash.to_cookie_string }
    end
  end
