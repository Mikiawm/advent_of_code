# typed: true

require_relative('command')
class Eval
  include Command

  def initialize(year, day)
    @year = year
    @day = day
  end

  def execute
    output = `ruby challanges/#{@year}/#{day_string}/test.rb`
    print output
  end
end
