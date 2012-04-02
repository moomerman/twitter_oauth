module TwitterOAuth
  class Client
    # Twitter limits /users/lookup.json to return 100 users at a time
    USERS_LOOKUP_SIZE = 100

    # Returns all Users given by array of users specified by either screen name or id
    def lookup users = []
      raise "No user ids specified" if users.empty?

      # Determine if dealing with screen_names or ids
      if users.first.is_a? Fixnum # dealing with user ids
        parameter = :user_id
      else user.first.is_a? String # dealing with screen names
        parameter = :screen_name
      end 

      return post('/users/lookup.json', parameter => users.join(',')) if users.count <= USERS_LOOKUP_SIZE

      friends = []

      users.each_slice(USERS_LOOKUP_SIZE) do |user_batch|
        json = post("/users/lookup.json", parameter => user_batch.join(','))

        # Raise errors
        raise "#{json['request']}: #{json['error']}" if json['error']

        friends += json
      end

      friends
    end
     
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

    # Rewritten to support new API calls - VT
    # Returns all pages of friends
    def all_friends
      # Get Twitter friend user ids
      ids = friends_ids

      # Perform lookup for user ids
      users = lookup ids
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
      # Get Twitter follower user ids
      ids = followers_ids

      # Perform lookup for user ids
      users = lookup ids
    end

  end
end
