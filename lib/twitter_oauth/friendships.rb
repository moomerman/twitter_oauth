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

    # Returns a cursored collection of user objects for every user the specified
    # user is following (otherwise known as their "friends")
    def friends(cursor=-1)
      get("/friends/list.json?cursor=#{cursor}")
    end

    # Helper to retrun all friends via multiple requests
    def all_friends(cursor=-1)
      users = []
      while cursor != 0 do
        json = friends(cursor)
        cursor = json["next_cursor"]
        users += json["users"]
      end
      users
    end

    # Returns a cursored collection of user objects for users following the
    # specified user.
    def followers(cursor=-1)
      get("/followers/list.json?cursor=#{cursor}")
    end

    # Helper to retrun all followers via multiple requests
    def all_followers(cursor=-1)
      users = []
      while cursor != 0 do
        json = followers(cursor)
        cursor = json["next_cursor"]
        users += json["users"]
      end
      users
    end

  end
end
