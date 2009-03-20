= Twitter OAuth Client for Ruby

TwitterOAuth::Client::CLIENT_KEY = 'xxxx'
TwitterOAuth::Client::CLIENT_SECRET = 'xxxx'

client = TwitterOAuth::Client.new
puts client.show('moomerman')