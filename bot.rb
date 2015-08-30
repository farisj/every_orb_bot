require 'rubygems'
require 'twitter'
require './twitter_keys'
require 'open-uri'
require 'pry'

adjectives = open("https://gist.githubusercontent.com/farisj/cc70300356eca8f54c47/raw/9885ef80b27c3834d654a158fe8d90321725c154/adjectives.txt").read.split("\n")


client = Twitter::REST::Client.new do |config|
  config.consumer_key = TWITTER_KEYS[:consumer_key]
  config.consumer_secret = TWITTER_KEYS[:consumer_secret]
  config.access_token = TWITTER_KEYS[:access_token]
  config.access_token_secret = TWITTER_KEYS[:access_token_secret]
end


adjectives.each do |adjective|

  # client.update("#{adjective} orb")

end
