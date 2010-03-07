module TwitterOAuth
  class Client
    
    # Return the most recent direct messages sent to the authenticating user.
    # By default, returns the last 20. See http://apiwiki.twitter.com/Twitter-REST-API-Method:-direct_messages
    # for other options
    def messages(options={})
      args = options.map{|k,v| "#{k}=#{v}"}.join('&')
      get("/direct_messages.json?#{args}")
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
