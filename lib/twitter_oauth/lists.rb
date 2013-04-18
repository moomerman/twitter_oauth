module TwitterOAuth
  class Client

    #
    # List methods
    #

    # Creates a new list for the authenticated user. Accounts are limited to 20 lists.
    def create_list(name, options={})
      post("/lists/create.json", options.merge(:name => name))
    end

    # Updates the specified list.
    def update_list( list_id, options={})
      post("/lists/update.json", options.merge(:list_id => list_id))
    end

    # List the lists of the specified user.
    # Private lists will be included if the authenticated user is the same as the user whose lists are being returned.
    def get_lists(options = {})
      args = options.map{|k,v| "#{k}=#{v}"}.join('&')
      get("/lists/list.json?#{args}")
    end

    # Show the specified list. Private lists will only be shown if the authenticated user owns the specified list.
    def get_list( list_id, options = {})
      options.merge!(:list_id => list_id)
      args = options.map{|k,v| "#{k}=#{v}"}.join('&')
      get("/lists/show.json?#{args}")
    end

    # Deletes the specified list. Must be owned by the authenticated user.
    def delete_list( list_id, options = {})
      options.merge!(:list_id => list_id)
      args = options.map{|k,v| "#{k}=#{v}"}.join('&')
      post("/lists/destroy.json?#{args}")
    end

    # Show tweet timeline for members of the specified list.
    def list_statuses( list_id, options={})
      options.merge!(:list_id => list_id)
      args = options.map{|k,v| "#{k}=#{v}"}.join('&')
      get("/lists/statuses.json?#{args}")
    end

    # List the lists the specified user has been added to.
    def list_memberships(options = {})
      args = options.map{|k,v| "#{k}=#{v}"}.join('&')
      get("/lists/memberships.json?#{args}")
    end

    # List the lists the specified user follows.
    def list_subscriptions(options = {})
      args = options.map{|k,v| "#{k}=#{v}"}.join('&')
      get("/lists/subscriptions.json?#{args}")
    end

    #
    # List Members Methods
    #

    # Returns the members of the specified list.
    def list_members( list_id, options = {})
      options.merge!(:list_id => list_id)
      args = options.map{|k,v| "#{k}=#{v}"}.join('&')
      get("/lists/members.json?#{args}")
    end

    # Add a member to a list. The authenticated user must own the list to be able to add members to it.
    # Lists are limited to having 500 members.
    def add_member_to_list(user_id, list_id, options={})
      post("/lists/members/create.json", options.merge(:user_id => user_id, :list_id => list_id))
    end

    # Removes the specified member from the list.
    # The authenticated user must be the list's owner to remove members from the list.
    def remove_member_from_list(user_id, list_id, options = {})
      post("/lists/members/destroy.json", options.merge(:user_id => user_id, :list_id => list_id))
    end

    #
    # List Subscribers Methods
    #

    # Returns the subscribers of the specified list.
    def list_subscribers( list_id, options={})
      options.merge!(:list_id => list_id)
      args = options.map{|k,v| "#{k}=#{v}"}.join('&')
      get("/lists/subscribers.json?#{args}")
    end

    # Make the authenticated user follow the specified list.
    def subscribe_to_list( list_id, options={})
      post("/lists/subscribers/create.json", options.merge(:list_id => list_id))
    end

    # Unsubscribes the authenticated user form the specified list.
    def unsubscribe_from_list( list_id, options={})
      post("/lists/subscribers/destroy.json", options.merge(:list_id => list_id))
    end

  end
end
