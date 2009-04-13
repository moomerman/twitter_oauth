module TwitterOAuth
  class Client
    
    def favorites(page=1)
      oauth_response = access_token.get("/favorites.json?page=#{page}")
      JSON.parse(oauth_response.body)
    end
    
    def favorite
      oauth_response = access_token.post("/favorites/create/#{id}.json")
      JSON.parse(oauth_response.body)
    end
    
    def unfavorite
      oauth_response = access_token.post("/favorites/destroy/#{id}.json")
      JSON.parse(oauth_response.body)
    end
    
  end
end