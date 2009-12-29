module TwitterOAuth
  class Client
    
    # Returns the top ten topics that are currently trending on Twitter.
    def trends
      get("/trends.json")
    end
    
  end
end