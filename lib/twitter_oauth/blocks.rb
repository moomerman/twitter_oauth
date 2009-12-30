module TwitterOAuth
  class Client
    
    # Blocks the user specified in the ID parameter as the authenticating user. 
    # Destroys a friendship to the blocked user if it exists. 
    # Returns the blocked user in the requested format when successful.
    def block(id)
      post("/blocks/create/#{id}.json")
    end
    
    # Un-blocks the user specified in the ID parameter for the authenticating user.  
    # Returns the un-blocked user in the requested format when successful.
    def unblock(id)
      post("/blocks/destroy/#{id}.json")
    end
    
    # Returns if the authenticating user is blocking a target user.
    def blocked?(id)
      get("/blocks/exists/#{id}.json")
    end
    
    # Returns an array of user objects that the authenticating user is blocking.
    def blocking
      get("/blocks/blocking.json")
    end
    
    # Returns an array of numeric user ids the authenticating user is blocking.
    def blocking_ids
      get("/blocks/blocking/ids.json")
    end
    
  end
end
