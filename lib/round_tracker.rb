require "round_tracker/version"
require "round_tracker/round"

require "nokogiri"
require "open-uri"

module RoundTracker
  doc = Nokogiri::HTML(open("http://www.cic.gc.ca/english/express-entry/rounds.asp"))

  num_invitations = doc.css('.table td').first.children.first.text
  post_date = doc.css('section time').first.children.first.text
  lowest_score = doc.css('.table td').last.children.first.text

  puts Round.new(post_date, num_invitations, lowest_score).inspect
end
