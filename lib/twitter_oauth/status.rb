module TwitterOAuth
  class Client
    
    # Returns a single status, specified by the id parameter below.
    def status(id)
      get("/statuses/show/#{id}.json")
    end
    
    # Updates the authenticating user's status.
    def update(message, options={})
      post('/statuses/update.json', options.merge(:status => message))
    end

    # Destroys the status specified by the required ID parameter
    def status_destroy(id)
      post("/statuses/destroy/#{id}.json")
    end
    
    # Retweets the tweet specified by the id parameter. Returns the original tweet with retweet details embedded.
    def retweet(id)
      post("/statuses/retweet/#{id}.json")
    end
    
    # Returns the 100 most recent retweets of the tweet.
    def retweets(id)
      get("/statuses/retweets/#{id}.json")
    end
    
  end
end
