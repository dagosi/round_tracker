require 'spec_helper'

module RoundTracker
  describe RoundParser do
    let(:latest_round_attributes ) do
      Hash.new(
        post_date: Date.parse("May 22, 2015"),
        num_invitations: "1,361",
        lowest_score: 755
      )
    end

    let(:latest_round_file) do 
      open(File.expand_path('../../html_rounds/latest.html', __FILE__))
    end

    let(:previous_rounds_file) do
      open(File.expand_path('../../html_rounds/previous.html', __FILE__))
    end

    describe "#latest_round" do
      it "returns a parsed round" do
        allow(RoundParser).to receive(:open).and_return(latest_round_file)
        
        expect(RoundParser.latest_round).to have_attributes(latest_round_attributes)
      end
    end

    describe '#previous_rounds' do
      it 'creates several round objects' do
        allow(RoundParser).to receive(:open).and_return(previous_rounds_file)

        previous_rounds = RoundParser.previous_rounds

        expect(previous_rounds).to be_a(Array)
        expect(previous_rounds).not_to be_empty
      end
    end

    describe '#parse_doc' do
      it "returns a round object" do
        doc = Nokogiri::HTML(latest_round_file)
        round = RoundParser.parse_doc(doc)

        expect(round).to have_attributes(latest_round_attributes)
      end
    end
  end
end