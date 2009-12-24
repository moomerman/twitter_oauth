module TwitterOAuth
  class Client
    
    # Returns the top ten topics that are currently trending on Twitter.
    def trends
      oauth_response = access_token.get("/trends.json")
      JSON.parse(oauth_response.body)
    end
    
  end
end