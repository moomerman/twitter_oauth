module TwitterOAuth
  class Client
    
    # Returns a single status, specified by the id parameter below.
    def status(id)
      oauth_response = access_token.get("/statuses/show/#{id}.json")
      JSON.parse(oauth_response.body)
    end
    
    # Updates the authenticating user's status.
    def update(message, options={})
      oauth_response = access_token.post('/statuses/update.json', options.merge(:status => message))
      JSON.parse(oauth_response.body)
    end

    # Destroys the status specified by the required ID parameter
    def status_destroy(id)
      oauth_response = access_token.post("/statuses/destroy/#{id}.json")
      JSON.parse(oauth_response.body)
    end
    
    # Retweets the tweet specified by the id parameter. Returns the original tweet with retweet details embedded.
    def retweet(id)
      oauth_response = access_token.post("/statuses/retweet/#{id}.json")
      JSON.parse(oauth_response.body)
    end
    
  end
end