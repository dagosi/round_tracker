module RoundScrapper
  class Round
    attr_accessor :post_date, :num_invitations, :lowest_score

    def initialize(post_date, num_invitations, lowest_score)
      @post_date = post_date.is_a?(Date) ? post_date : Date.parse(post_date)
      @num_invitations = num_invitations
      @lowest_score = lowest_score.to_i
    end
  end
end