module TwitterOAuth
  class Client

    # Blocks the user specified in the ID parameter as the authenticating user.
    # Destroys a friendship to the blocked user if it exists.
    # Returns the blocked user in the requested format when successful.
    def block(id)
      #support only twitter_uid not screen_name
      post("/blocks/create.json", {:user_id => id})
    end

    # Un-blocks the user specified in the ID parameter for the authenticating user.
    # Returns the un-blocked user in the requested format when successful.
    def unblock(id)
      #support only twitter_uid not screen_name
      post("/blocks/destroy.json", {:user_id => id})
    end

    # Returns if the authenticating user is blocking a target user.
    def blocked?(id)
      raise TwitterDeprecatedError
    end

    # Returns an array of user objects that the authenticating user is blocking.
    def blocking
      get("/blocks/list.json")
    end

    # Returns an array of numeric user ids the authenticating user is blocking.
    def blocking_ids
      get("/blocks/ids.json")
    end

  end
end
