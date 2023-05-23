# typed: true

module Command
  def cookie
    @cookie ||= ENV['AOC_COOKIE']
  end

  def cookie_present?
    ENV.key?('AOC_COOKIE')
  end

  def input_file_name
    "challanges/#{@year}/#{day_string}/input.txt"
  end

  def day_string
    @day.to_i < 10 ? "0#{@day}" : @day
  end

  def solution_file_name
    "challanges/#{@year}/#{day_string}/solution.rb"
  end

  def test_file_name
    "challanges/#{@year}/#{day_string}/test.rb"
  end

  def part_string
    @part == '1' ? 'part_one' : 'part_two'
  end
end
