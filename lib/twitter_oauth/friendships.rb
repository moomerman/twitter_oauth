module TwitterOAuth
  class Client
    
    # Returns an array of numeric IDs for every user the specified user is following.
    def friends_ids
      user_ids = []
      cursor = '-1'
      while cursor != 0 do
        json = get("/friends/ids.json?cursor=#{cursor}")
        cursor = json['next_cursor']

        # Raise errors
        raise "#{json['request']}: #{json['error']}" if json['error']

        user_ids += json['ids'] if json['ids']
      end
      user_ids
    end
    
    # Returns an array of numeric IDs for every user following the specified user.
    def followers_ids
      user_ids = []
      cursor = '-1'
      while cursor != 0 do
        json = get("/followers/ids.json?cursor=#{cursor}")
        cursor = json['next_cursor']

        # Raise errors
        raise "#{json['request']}: #{json['error']}" if json['error']

        user_ids += json['ids'] if json['ids']
      end
      user_ids
    end
    
    # Allows the authenticating user to follow the specified user. Returns the befriended user when successful.
    def friend(id)
      post("/friendships/create/#{id}.json")
    end
    
    # Allows the authenticating users to unfollow the specified user. Returns the unfollowed user when successful. 
    def unfriend(id)
      post("/friendships/destroy/#{id}.json")
    end
    
    # Tests for the existence of friendship between two users. Will return true if user_a follows user_b, otherwise will return false.
    # You are better off using get_friendship as it returns more extended information.
    def friends?(a, b)
      oauth_response = access_token.get("/friendships/exists.json?user_a=#{a}&user_b=#{b}")
      oauth_response.body.strip == 'true'
    end
    
    # Returns detailed information about the relationship between two users.
    def get_friendship(a, b)
      get("/friendships/show.json?source_screen_name=#{a}&target_screen_name=#{b}")
    end
    
  end
end
