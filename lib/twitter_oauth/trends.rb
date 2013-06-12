module TwitterOAuth
  class Client

    # Returns the top 10 trending topics for a specific WOEID, if trending
    # information is available for it. The response is an array of "trend"
    # objects that encode the name of the trending topic, the query parameter
    # that can be used to search for the topic on Twitter Search, and the
    # Twitter Search URL....
    def place_trends
      get("/trends/place.json")
    end

    # Returns the locations that Twitter has trending topic information for. The
    # response is an array of "locations" that encode the location's WOEID and
    # some other human-readable information such as a canonical name and country
    # the location belongs in. A WOEID is a Yahoo! Where On Earth ID.
    def available_trends
      get("/trends/available.json")
    end

    # Returns the locations that Twitter has trending topic information for,
    # closest to a specified location. The response is an array of "locations"
    # that encode the location's WOEID and some other human-readable information
    # such as a canonical name and country the location belongs in.
    # A WOEID is a Yahoo...
    def closest_trends
      get("/trends/closest.json")
    end

  end
end