require "nokogiri"
require "open-uri"

module RoundTracker
  class RoundParser
    class << self
      def latest_round
        doc = Nokogiri::HTML(open("http://www.cic.gc.ca/english/express-entry/rounds.asp"))
        parse_doc(doc)
      end

      def previous_rounds
        doc = Nokogiri::HTML(open("http://www.cic.gc.ca/english/express-entry/past-rounds.asp"))

        doc.css('section details').each_with_object([]) do |detail, rounds|
          rounds << parse_doc(detail)
        end
      end

      def parse_doc(doc)
        post_date       = doc.css('time').first.children.first.text
        lowest_score    = doc.css('.table td').last.children.first.text
        num_invitations = doc.css('.table td').first.children.first.text

        Round.new(post_date, num_invitations, lowest_score)
      end
    end
  end
end