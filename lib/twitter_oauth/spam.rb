module TwitterOAuth
  class Client
    
    # The user specified in the id is blocked by the authenticated user and reported as a spammer.
    def report_spam(user)
      post("/report_spam.json", :id => user)
    end
    
  end
end