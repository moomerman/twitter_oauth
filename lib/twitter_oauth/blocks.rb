module TwitterOAuth
  class Client
    
    # unblock this user.
    def block(id)
      post("/blocks/create/#{id}.json")
    end
    
    # block this user.
    def unblock(id)
      post("/blocks/destroy/#{id}.json")
    end
    
  end
end
