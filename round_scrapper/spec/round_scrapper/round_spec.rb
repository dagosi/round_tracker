require 'spec_helper'

module RoundScrapper
  describe Round do
    describe "#create" do
      let!(:round) { Round.new(Date.parse("Jun 7, 2015"), 300, 765) }

      it "sets post_date" do
        expect(round.post_date).to eq(Date.parse("Jun 7, 2015"))
      end

      it "sets num_invitations" do
        expect(round.num_invitations).to eq(300)
      end

      it "sets lowest_score" do
        expect(round.lowest_score).to eq(765)
      end
    end

    describe "#post_date" do
      it "parses a string when assigning" do
        round = Round.new("Jun 7, 2015", nil, nil)

        expect(round.post_date).to eq(Date.parse("Jun 7, 2015"))
      end
    end

    describe "#lowest_score" do
      it "parses the value to set" do
        round = Round.new("Jun 7, 2015", nil, "765 points")

        expect(round.lowest_score).to eq(765)
      end
    end
  end
end