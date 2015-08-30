require 'rubygems'
require 'twitter'
require './twitter_keys'
require 'open-uri'
require 'pry'

adjective_url = "https://gist.githubusercontent.com/farisj/cc70300356eca8f54c47/raw/9885ef80b27c3834d654a158fe8d90321725c154/adjectives.txt"

adjectives = open(adjective_url).read.split("\n")

client = Twitter::REST::Client.new do |config|
  config.consumer_key = TWITTER_KEYS[:consumer_key]
  config.consumer_secret = TWITTER_KEYS[:consumer_secret]
  config.access_token = TWITTER_KEYS[:access_token]
  config.access_token_secret = TWITTER_KEYS[:access_token_secret]
end

most_recent_tweet = client.user_timeline("everyorb").first

if most_recent_tweet

  most_recent_adjective = most_recent_tweet.text.split(" ").first

  recent_adj_index = adjectives.find_index(most_recent_adjective)

  client.update("#{adjectives[recent_adj_index+1]} orb")

end