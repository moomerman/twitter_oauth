require 'open-uri'

module TwitterOAuth
  class Client

    def search(q, options={})
      options[:q] = URI.escape(q)
      args = options.map{|k,v| "#{k}=#{v}"}.join('&')
      get("/search/tweets.json?#{args}")
    end

    # Returns the current top 10 trending topics on Twitter.
    def current_trends(woe_id = 1)
      get("/trends/place.json?id=#{woe_id}")
    end

    # Returns the top 20 trending topics for each hour in a given day.
    def daily_trends
      raise TwitterDeprecatedError
    end

    # Returns the top 30 trending topics for each day in a given week.
    def weekly_trends
      raise TwitterDeprecatedError
    end

  end
end
