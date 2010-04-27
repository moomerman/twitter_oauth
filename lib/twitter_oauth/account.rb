module TwitterOAuth
  class Client
    
    # Returns an HTTP 200 OK response code and a representation of the requesting user if authentication was successful; 
    # returns a 401 status code and an error message if not.
    def authorized?
      oauth_response = access_token.get('/account/verify_credentials.json')
      return oauth_response.class == Net::HTTPOK
    end
    
    # Returns client info
    def info
      get('/account/verify_credentials.json')
    end
    
    # Returns the remaining number of API requests available to the requesting user before the API limit is reached for the current hour.
    def rate_limit_status
      get('/account/rate_limit_status.json')
    end
    
    # Updates profile background image. Takes a File object and optional tile argument.
    # Returns extended user info object.
    def update_profile_background_image(image, tile = false)
      body, headers = http_multipart_data({:image => image, :tile => tile})
      post('/account/update_profile_background_image.json', body, headers)
    end
    
    # Updates profile avatar image. Takes a File object which should be an image.
    # Returns extended user info object.
    def update_profile_image(image)
      body, headers = http_multipart_data({:image => image})
      post('/account/update_profile_image.json', body, headers)
    end
    
    # colors hash must contain at least one or more of the following keys :profile_background_color, :profile_text_color, :profile_link_color, :profile_sidebar_fill_color, :profile_sidebar_border_color 
    # returns extended user info object.
    def update_profile_colors(colors)
      post('/account/update_profile_colors.json', colors)
    end
    
    # Sets values that users are able to set under the "Account" tab of their settings page.
    # Valid parameters are:
    #   :name     Full name associated with the profile. Maximum of 20 characters.
    #   :url      URL associated with the profile. Will be prepended with "http://" if not present. Maximum of 100 characters.
    #   :location The city or country describing where the user of the account is located. The contents are not normalized
    #             or geocoded in any way. Maximum of 30 characters.
    #   :description A description of the user owning the account. Maximum of 160 characters.
    def update_profile(params)
      post('/account/update_profile', params)
    end
    
  end
end
