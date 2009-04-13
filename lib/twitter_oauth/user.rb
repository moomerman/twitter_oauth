module TwitterOAuth
  class Client
     
    # Returns the 100 last friends
    def friends(page=1)
      oauth_response = access_token.get("/statuses/friends.json?page=#{page}")
      JSON.parse(oauth_response.body)
    end 
    
    # Returns the 100 last followers
    def followers(page=1)
      oauth_response = access_token.get("/statuses/followers.json?page=#{page}")
      JSON.parse(oauth_response.body)
    end
    
  end
end