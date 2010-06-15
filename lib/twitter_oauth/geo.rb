module TwitterOAuth
  class Client
    
    # Search for places (cities and neighborhoods) that can be attached to a statuses/update. 
    # Given a latitude and a longitude, return a list of all the valid places that can be used as a place_id when updating a status
    def reverse_geocode(lat, lng, options={})
      options[:lat] = lat; options[:lng] = lng
      args = options.map{|k,v| "#{k}=#{v}"}.join('&')
      get "/geo/reverse_geocode.json?#{args}"
    end
    
    # Search for places (cities and neighborhoods) that can be attached to a statuses/update. 
    # Given a latitude and a longitude pair, or an IP address, return a list of all the valid cities 
    # and neighborhoods that can be used as a place_id when updating a status.
    def geo_search(options={})
      options[:query] = URI.escape(options[:query]) if options[:query]
      args = options.map{|k,v| "#{k}=#{v}"}.join('&')
      get "/geo/search.json?#{args}"
    end
    
    # Find out more details of a place that was returned from the geo/reverse_geocode method.
    def geo(id)
      get "/geo/id/#{id}.json"
    end
  
  end
end