Twitter OAuth client library for Ruby
=====================================

To make authorized requests with the client library you'll need to [create a Twitter OAuth Application](http://twitter.com/oauth_clients/new).

See [sinitter](http://github.com/moomerman/sinitter/tree/master) for a full website integration example.

Unauthorized request example
============================

`client = TwitterOAuth::Client.new  
puts client.show('moomerman')`

Authorized request example
==========================

<p><code>
TwitterOAuth::Client::CLIENT_KEY = 'YOUR-CONSUMER-KEY'  
TwitterOAuth::Client::CLIENT_SECRET = 'YOUR-CONSUMER-SECRET'  

client = TwitterOAuth::Client.new  
request_token = client.request_token # store the request token somewhere for later  
puts "redirect the user to '#{request_token.authorize_url}'"  
=> redirect the user to 'http://twitter.com/oauth/authorize?oauth_token=TOKEN'  
</code></p>

In your application your user would be redirected to Twitter to authorize the application.

<p><code>
access_token = client.login(
  request_token.token,
  request_token.secret
)
client.authorized?
=> true
</code></p>

