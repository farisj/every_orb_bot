require 'twitter'
require 'open-uri'

adjective_url = "https://gist.githubusercontent.com/farisj/cc70300356eca8f54c47/raw"

adjectives = open(adjective_url).read.split("\n")

client = Twitter::REST::Client.new do |config|
  config.consumer_key = ENV["consumer_key"]
  config.consumer_secret = ENV["consumer_secret"]
  config.access_token = ENV["access_token"]
  config.access_token_secret = ENV["access_token_secret"]
end

most_recent_tweet = client.user_timeline("everyorb").first

if most_recent_tweet

  most_recent_adjective = most_recent_tweet.text.split(" ").first

  recent_adj_index = adjectives.find_index(most_recent_adjective)

  client.update("#{adjectives[recent_adj_index+1]} orb")

end
