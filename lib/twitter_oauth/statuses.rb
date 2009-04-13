module TwitterOAuth
  class Client
    
    # Returns the 20 most recent statuses from non-protected users who have set a custom user icon.
    def public_timeline
      oauth_response = access_token.get('/statuses/public_timeline.json')
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