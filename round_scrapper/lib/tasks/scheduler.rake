namespace :round_scrapper do
  desc "Checks if there was a new draw in the last 24 hours"
  task :check_latest_draw do
    latest_round = RoundScrapper::RoundParser.latest_round
    puts latest_round.inspect
  end
end