namespace :round_scrapper do
  desc "Sends an email if there was a new draw in the last 24 hours"
  task :check_latest_draw do
    latest_round = RoundScrapper::RoundParser.latest_round

    # Send an email notification if the round was posted in
    # the last 24 hours.
    if latest_round.post_date >= DateTime.now - 1
      RoundScrapper::Mailer.send_notification(latest_round.to_s)
    end
  end
end