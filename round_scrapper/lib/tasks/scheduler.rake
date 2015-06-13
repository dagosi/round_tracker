namespace :round_scrapper do
  desc "Checks if there was a new draw in the last 48 hours"
  task :check_latest_draw do
    latest_round = RoundScrapper::RoundParser.latest_round
    
    if latest_round.post_date >= DateTime.now - 2
      RoundScrapper::Mailer.send_notification(latest_round.to_s)
    end
  end
end