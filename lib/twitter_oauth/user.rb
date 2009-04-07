module TwitterOAuth
  class Client
     
    # Returns the 100 last followers
    def followers(page=1)
      oauth_response = access_token.get("/statuses/followers.json?page=#{page}")
      JSON.parse(oauth_response.body)
    end
    
  end
end