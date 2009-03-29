module TwitterOAuth
  class Client
    
    # unblock this user.
    def block(id)
      oauth_response = access_token.post("/blocks/create/#{id}.json")
      JSON.parse(oauth_response.body)
    end
    
    # block this user.
    def unblock(id)
      oauth_response = access_token.post("/blocks/destroy/#{id}.json")
      JSON.parse(oauth_response.body)
    end
    
  end
end