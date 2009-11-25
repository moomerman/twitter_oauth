module TwitterOAuth
  class Client
    
    # follow this user.
    def follow(id)
      post("/notifications/follow/#{id}.json")
    end
    
    # unfollow.
    def leave(id)
      post("/notifications/leave/#{id}.json")
    end
    
  end
end
