module TwitterOAuth
  class Client

    # Returns an array of numeric IDs for every user the specified user is following.
    def friends_ids(options={})
      args = options.map{|k,v| "#{k}=#{v}"}.join('&')
      get("/friends/ids.json?#{args}")
    end

    # Returns an array of numeric IDs for every user following the specified user.
    def followers_ids(options={})
      args = options.map{|k,v| "#{k}=#{v}"}.join('&')
      get("/followers/ids.json?#{args}")
    end

    # Allows the authenticating user to follow the specified user. Returns the befriended user when successful.
    def follow(id)
      post("/friendships/create.json", {:user_id => id})
    end

    # Allows the authenticating users to unfollow the specified user. Returns the unfollowed user when successful.
    def unfollow(id)
      post("/friendships/destroy.json", {:user_id => id})
    end

    # Tests for the existence of friendship between two users. Will return true if user_a follows user_b, otherwise will return false.
    # You are better off using get_friendship as it returns more extended information.
    def follows?(id)
      friends_ids["ids"].include?(id)
#      access_token.get("/friendships/lookup.json?user_id=#{id}")
    end

    # Returns detailed information about the relationship between two users.
    def get_friendship(id)
      get("/friendships/lookup.json?user_id=#{id}")
    end

  end
end
