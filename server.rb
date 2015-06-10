require "sinatra"
require "round_scrapper"

configure do
  set :views, 'app/views/'
  set :public_folder, 'app/assets'
end

get '/' do
  @all_rounds = RoundScrapper::RoundParser.all_rounds
  erb :index
end