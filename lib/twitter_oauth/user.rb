module TwitterOAuth
  class Client

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

  end
end
