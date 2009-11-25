module TwitterOAuth
  class Client
    
    def friends_ids(options={})
      args = options.map{|k,v| "#{k}=#{v}"}.join('&')
      get("/friends/ids.json?#{args}")
    end
    
    def followers_ids(options={})
      args = options.map{|k,v| "#{k}=#{v}"}.join('&')
      get("/followers/ids.json?#{args}")
    end
    
    # friend this user.
    def friend(id)
      oauth_response = access_token.post("/friendships/create/#{id}.json")
      JSON.parse(oauth_response.body)
    end
    
    # unfriend.
    def unfriend(id)
      oauth_response = access_token.post("/friendships/destroy/#{id}.json")
      JSON.parse(oauth_response.body)
    end
    
    # exists?.
    def exists?(a, b)
      oauth_response = access_token.get("/friendships/exists.json?user_a=#{a}&user_b=#{b}")
      oauth_response.body.strip == 'true'
    end
    
  end
end
