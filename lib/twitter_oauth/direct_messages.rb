module TwitterOAuth
  class Client
    
    # Returns a list of the 20 most recent direct messages sent to the authenticating user.
    def messages(page=1)
      get("/direct_messages.json?page=#{page}")
    end
    
    # Returns a list of the 20 most recent direct messages sent by the authenticating user.
    def sent_messages
      get('/direct_messages/sent.json')
    end
    
    # Sends a new direct message to the specified user from the authenticating user.
    def message(user, text)
      post('/direct_messages/new.json', :user => user, :text => text)
    end
    
    # Destroys the direct message specified in the required ID parameter.
    def message_destroy(id)
      post("/direct_messages/destroy/#{id}.json")
    end
    
  end
end
