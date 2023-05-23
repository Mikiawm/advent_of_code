# typed: true

require 'httparty'

class AocApi
  include HTTParty

  base_uri 'https://adventofcode.com'

  def self.get_input(year, day, session_cookie)
    get(
      "/#{year}/day/#{day}/input",
      headers: cookie_header(session_cookie)
    )
  end

  def self.submit(year, day, part, answer, session_cookie)
    post(
      "/#{year}/day/#{day}/answer",
      headers: {
        'Cookie' => "session=#{session_cookie}",
        'User-Agent' => 'mikiawm@gmail.com'
      },
      follow_redirects: false,
      body: { level: part.to_s, answer: answer.to_s }
    )
  end

  def self.cookie_header(session_cookie)
    cookie_hash = HTTParty::CookieHash.new
    cookie_hash.add_cookies(session: session_cookie)
    { 'Cookie' => cookie_hash.to_cookie_string }
  end
end
