require "nokogiri"
require "open-uri"

module RoundTracker
  class RoundParser
    LATEST_ROUND_URL = "http://www.cic.gc.ca/english/express-entry/rounds.asp"

    class << self
      def parse_latest
        doc = Nokogiri::HTML(open(LATEST_ROUND_URL))

        post_date       = doc.css('section time').first.children.first.text
        lowest_score    = doc.css('.table td').last.children.first.text
        num_invitations = doc.css('.table td').first.children.first.text

        Round.new(post_date, num_invitations, lowest_score)
      end
    end
  end
end