module TwitterOAuth
  class Client
     
    # Returns the 100 last friends
    # The page parameter is implemented for legacy reasons, but use of this is slow
    # as passing page is no longer supported by the Twitter API as the use of cursors
    # is now obligitory. It is recommended that you use all_friends instead
    def friends(page=1)
      return get("/statuses/friends.json?page=#{page}") if page == 1
      users = []
      cursor = "-1"
      page.times do 
        return [] if cursor == 0 
        json = get("/statuses/friends.json?cursor=#{cursor}")
        cursor = json["next_cursor"]
        users = json["users"]
      end
      users
    end 

    # Returns all pages of friends
    def all_friends
      users = []
      cursor = "-1"
      while cursor != 0 do 
        json = get("/statuses/friends.json?cursor=#{cursor}")
        cursor = json["next_cursor"]
        users += json["users"]
      end
      users
    end
    
    # Returns the 100 last followers
    def followers(page=1)
      return get("/statuses/followers.json?page=#{page}") if page == 1
      users = []
      cursor = "-1"
      page.times do 
        return [] if cursor == 0 
        json = get("/statuses/followers.json?cursor=#{cursor}")
        cursor = json["next_cursor"]
        users = json["users"]
      end
      users
    end 

    # Returns all pages of followers
    def all_followers
      users = []
      cursor = "-1"
      while cursor != 0 do 
        json = get("/statuses/followers.json?cursor=#{cursor}")
        cursor = json["next_cursor"]
        users += json["users"]
      end
      users
    end

    def users_lookup(users)
      get("/users/lookup.json?user_id=#{users.join(',')}")
    end

  end
end
