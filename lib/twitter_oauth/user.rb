module TwitterOAuth
  class Client

    def lookup(options={})
      raise ArgumentError, "No usernames or user ids specified" if options[:screen_name].nil? and options[:user_id].nil?      
      params = options.inject([]) {|memo, (k,v)| memo << "#{k}=#{v.join(',')}"}.join('&')
      get("/users/lookup.json?#{params}")
    end

    # Returns settings (including current trend, geo and sleep time information)
    # for the authenticating user.
    def settings
      get('/account/settings.json')
    end

    # Returns an HTTP 200 OK response code and a representation of the
    # requesting user if authentication was successful; returns a 401 status
    # code and an error message if not. Use this method to test if supplied user
    # credentials are valid.
    def verify_credentials
      get('/account/verify_credentials.json')
    end
    
    # Search for users
    def users_search(q, options={})
      options[:count] ||= 20
      options[:q] = URI.escape(q)
      args = options.map{|k,v| "#{k}=#{v}"}.join('&')
      get("/users/search.json?#{args}")
    end

  end
end
