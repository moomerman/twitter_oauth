module TwitterOAuth
  class Client
    
    #
    # List methods
    #
    
    # Creates a new list for the authenticated user. Accounts are limited to 20 lists. 
    def create_list(user, list, options={})
      post("/#{user}/lists.json", options.merge(:name => list))
    end
    
    # Updates the specified list. 
    def update_list(user, list, options={})
      post("/#{user}/lists/#{list}.json", options)
    end
    
    # List the lists of the specified user. 
    # Private lists will be included if the authenticated user is the same as the user whose lists are being returned.
    def get_lists(user)
      get("/#{user}/lists.json")
    end
    
    # Show the specified list. Private lists will only be shown if the authenticated user owns the specified list.
    def get_list(user, list)
      get("/#{user}/lists/#{list}.json")
    end
    
    # Deletes the specified list. Must be owned by the authenticated user. 
    def delete_list(user, list)
      delete("/#{user}/lists/#{list}.json")
    end
    
    # Show tweet timeline for members of the specified list.
    def list_statuses(user, list)
      get("/#{user}/lists/#{list}/statuses.json")
    end
    
    # List the lists the specified user has been added to.
    def list_memberships(user)
      get("/#{user}/lists/memberships.json")
    end
    
    # List the lists the specified user follows.
    def list_subscriptions(user)
      get("/#{user}/lists/subscriptions.json")
    end
    
    #
    # List Members Methods
    #
    
    # Returns the members of the specified list.
    def list_members(user, list)
      get("/#{user}/#{list}/members.json")
    end
    
    # Add a member to a list. The authenticated user must own the list to be able to add members to it. 
    # Lists are limited to having 500 members.
    def add_member_to_list(user, list, member_id, options={})
      post("/#{user}/#{list}/members.json", options.merge(:id => member_id))
    end
    
    # Removes the specified member from the list. 
    # The authenticated user must be the list's owner to remove members from the list.
    def remove_member_from_list(user, list, member_id)
      delete("/#{user}/#{list}/members.json?id=#{member_id}")
    end
    
    # Check if a user is a member of the specified list.
    def get_member_of_list(user, list, member_id)
      get("/#{user}/#{list}/members/#{member_id}.json")
    end
    
    #
    # List Subscribers Methods
    #
    
    # Returns the subscribers of the specified list.
    def list_subscribers(user, list)
      get("/#{user}/#{list}/subscribers.json")
    end
    
    # Make the authenticated user follow the specified list.
    def subscribe_to_list(user, list, options={})
      post("/#{user}/#{list}/subscribers.json")
    end
    
    # Unsubscribes the authenticated user form the specified list.
    def unsubscribe_from_list(user, list)
      delete("/#{user}/#{list}/subscribers.json")
    end
    
    # Check if the specified user is a subscriber of the specified list.
    def get_subscriber_of_list(user, list, subscriber_id)
      get("/#{user}/#{list}/subscribers/#{subscriber_id}.json")
    end
    
  end
end