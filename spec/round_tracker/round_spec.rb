require 'spec_helper'

module RoundTracker
  describe Round do
    describe "#create" do
      let!(:round) { Round.new(Date.parse("Jun 7, 2015"), 300, 765) }

      it "should set post_date" do
        expect(round.post_date).to eq(Date.parse("Jun 7, 2015"))
      end

      it "should set num_invitations" do
        expect(round.num_invitations).to eq(300)
      end

      it "should set lowest_score" do
        expect(round.lowest_score).to eq(765)
      end
    end

    describe "#post_date" do
      it "should parse a string when assigning" do
        round = Round.new("Jun 7, 2015", nil, nil)

        expect(round.post_date).to eq(Date.parse("Jun 7, 2015"))
      end
    end
  end
end