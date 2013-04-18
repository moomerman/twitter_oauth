module TwitterOAuth
  class Client
    # ids must be comma seperated string
    def lookup(ids)
      get("/users/lookup.json?user_id=#{ids}")
    end
  end
end
