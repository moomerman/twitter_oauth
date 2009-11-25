module TwitterOAuth
  class Client
    
    def favorites(page=1)
      get("/favorites.json?page=#{page}")
    end
    
    def favorite
      post("/favorites/create/#{id}.json")
    end
    
    def unfavorite
      post("/favorites/destroy/#{id}.json")
    end
    
  end
end
