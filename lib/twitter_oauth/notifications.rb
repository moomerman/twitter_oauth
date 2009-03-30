module TwitterOAuth
  class Client
    
    # follow this user.
    def follow(id)
      oauth_response = access_token.post("/notifications/follow/#{id}.json")
      JSON.parse(oauth_response.body)
    end
    
    # unfollow.
    def leave(id)
      oauth_response = access_token.post("/notifications/leave/#{id}.json")
      JSON.parse(oauth_response.body)
    end
    
  end
end