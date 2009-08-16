module TwitterOAuth
  class Client
    
    # Returns the 20 most recent statuses from non-protected users who have set a custom user icon.
    def public_timeline
      oauth_response = access_token.get('/statuses/public_timeline.json')
      JSON.parse(oauth_response.body)
    end
    
    # Returns the 20 most recent statuses, including retweets, posted by the authenticating user and that user's friends. 
    # This is the equivalent of /timeline/home on the Web.
    def home_timeline
      oauth_response = access_token.get("/statuses/home_timeline.json")
      JSON.parse(oauth_response.body)
    end
    
    # Returns the 20 most recent statuses posted by the authenticating user and that user's friends.
    def friends_timeline(rpp=20, page=1)
      oauth_response = access_token.get("/statuses/friends_timeline.json?count=#{rpp}&page=#{page}")
      JSON.parse(oauth_response.body)
    end
    
    # Returns the 20 most recent statuses posted from the authenticating user.
    def user(page=1)
      oauth_response = access_token.get("/statuses/user_timeline.json?page=#{page}")
      JSON.parse(oauth_response.body)
    end
    
    # Returns a single status, specified by the id parameter below.
    def status(id)
      oauth_response = access_token.get("/statuses/show/#{id}.json")
      JSON.parse(oauth_response.body)
    end
    
    # Updates the authenticating user's status.
    def update(message)
      oauth_response = access_token.post('/statuses/update.json', :status => message)
      JSON.parse(oauth_response.body)
    end
    
    # Returns the 20 most recent @replies (status updates prefixed with @username) for the authenticating user.
    def replies(page=1)
      oauth_response = access_token.get("/statuses/mentions.json?page=#{page}")
      JSON.parse(oauth_response.body)
    end
    
    # Retweets the tweet specified by the id parameter. Returns the original tweet with retweet details embedded.
    def retweet(id)
      oauth_response = access_token.post("/statuses/retweet/#{id}.json")
      JSON.parse(oauth_response.body)
    end
    
    # Returns the 20 most recent retweets posted by the authenticating user
    def retweeted_by_me
      oauth_response = access_token.get("/statuses/retweeted_by_me.json")
      JSON.parse(oauth_response.body)
    end
    
    # Returns the 20 most recent retweets posted by the authenticating user's friends.
    def retweeted_to_me
      oauth_response = access_token.get("/statuses/retweeted_to_me.json")
      JSON.parse(oauth_response.body)
    end
    
    # Returns the 20 most recent tweets of the authenticated user that have been retweeted by others.
    def retweets_of_me
      oauth_response = access_token.get("/statuses/retweets_of_me.json")
      JSON.parse(oauth_response.body)
    end
    
    # alias
    def mentions
      replies
    end
    
    # Destroys the status specified by the required ID parameter
    def status_destroy(id)
      oauth_response = access_token.post("/statuses/destroy/#{id}.json")
      JSON.parse(oauth_response.body)
    end
    
  end
end