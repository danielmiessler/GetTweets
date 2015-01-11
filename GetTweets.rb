require 'rubygems'
require 'twitter'

client = Twitter::REST::Client.new do |config|
    config.consumer_key        = "YOURS"
    config.consumer_secret     = "YOURS"
    config.access_token        = "YOURS"
    config.access_token_secret = "YOURS"
end

# Open tweets file
filename = "/etc/scripts/5tweets.txt"
filehandle = File.open(filename, "w")

# Pull latest five tweets and display them
client.user_timeline.take(5).collect do |tweet|
     filehandle.puts  "<li>#{tweet.text}</li>"
     filehandle.puts  "-"
      end

filehandle.close
