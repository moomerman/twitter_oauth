Twitter OAuth Client for Ruby
=============================

To use the client library you'll need to [create a Twitter OAuth Application](http://twitter.com/oauth_clients/new).

Example
=======

`
TwitterOAuth::Client::CLIENT_KEY = 'YOUR-CONSUMER-KEY'  
TwitterOAuth::Client::CLIENT_SECRET = 'YOUR-CONSUMER-SECRET'  

request_token = @client.request_token  

client = TwitterOAuth::Client.new  
puts client.show('moomerman')
`

See [sinitter](http://github.com/moomerman/sinitter/tree/master) for a full website integration example.
