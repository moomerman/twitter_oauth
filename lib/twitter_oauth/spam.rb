module TwitterOAuth
  class Client

    # The user specified in the id is blocked by the authenticated user and reported as a spammer.
    def report_spam(id)
      post("users/report_spam.json", :user_id => id)
    end

  end
end
