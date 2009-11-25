module TwitterOAuth
  class Client
     
    # Returns the 100 last friends
    def friends(page=1)
      get("/statuses/friends.json?page=#{page}")
    end 
    
    # Returns the 100 last followers
    def followers(page=1)
      get("/statuses/followers.json?page=#{page}")
    end
    
  end
end
