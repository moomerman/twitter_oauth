module TwitterOAuth
  class Client
    
    # Returns a list of the 20 most recent direct messages sent to the authenticating user.
    def messages
      oauth_response = access_token.get('/direct_messages.json')
      JSON.parse(oauth_response.body)
    end
    
    # Returns a list of the 20 most recent direct messages sent by the authenticating user.
    def sent_messages
      oauth_response = access_token.get('/direct_messages/sent.json')
      JSON.parse(oauth_response.body)
    end
    
    # Sends a new direct message to the specified user from the authenticating user.
    def message(user, text)
      oauth_response = access_token.post('/direct_messages/new.json', :user => user, :text => text)
      JSON.parse(oauth_response.body)
    end
    
  end
end