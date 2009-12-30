module TwitterOAuth
  class Client
    
    # Returns the 20 most recent favorite statuses for the authenticating user or user specified by the ID parameter.
    def favorites(page=1)
      get("/favorites.json?page=#{page}")
    end
    
    # Favorites the status specified in the ID parameter as the authenticating user. 
    # Returns the favorite status when successful.
    def favorite
      post("/favorites/create/#{id}.json")
    end
    
    # Un-favorites the status specified in the ID parameter as the authenticating user. 
    # Returns the un-favorited status when successful.
    def unfavorite
      post("/favorites/destroy/#{id}.json")
    end
    
  end
end
