module TwitterOAuth
  class Client
    
    # Returns the top ten topics that are currently trending on Twitter.
    def trends
      get("/trends.json")
    end
    
    # Returns the locations that Twitter has trending topic information for. 
    # The response is an array of "locations" that encode the location's WOEID (a Yahoo! Where On Earth ID)
    # and some other human-readable information such as a canonical name and country the location belongs in.
    def trends_available
      get("/trends/available.json")
    end
    
    # Returns the top 10 trending topics for a specific location Twitter has trending topic information for. 
    # The response is an array of "trend" objects that encode the name of the trending topic, the query 
    # parameter that can be used to search for the topic on Search, and the direct URL that can be issued against Search. 
    # This information is cached for five minutes, and therefore users are discouraged from querying these endpoints 
    # faster than once every five minutes.  Global trends information is also available from this API by using a WOEID of 1.
    def trends_for_location(woeid)
      get("/trends/woeid.json")
    end
  end
end