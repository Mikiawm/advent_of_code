# typed: true

require_relative('command')
require_relative('aoc_api')

class Submit
  include Command
  def initialize(year, day, part)
    @year = year
    @day = day
    @part = part

    submit_answer
  end

  def submit_answer
    load(solution_file_name)

    challange = Object.const_get("Year#{@year}").const_get("Day#{day_string}").new

    p challange.methods

    answer = challange.send(part_string)

    response = AocApi.submit(@year, day_string, @part, answer, cookie)

    check_response(response.body)
  end

  def check_response(response_body)
    wrong = /not the right answer/.match?(response_body)
    already_complete = /Did you already complete it/.match?(response_body)
    waiting_regex = /You have (\d*m* *\d+s) left to wait/
    waiting = waiting_regex.match?(response_body)

    correct = !wrong && !already_complete && !waiting

    return "That's not the right answer" if wrong
    return 'You have already completed this challenge' if already_complete
    return response_body[waiting_regex] if waiting

    return 'Correct' if correct
  end
end
