require 'open-uri'

module TwitterOAuth
  class Client
    
    def search(q, options={})
      options[:page] ||= 1
      options[:rpp] ||= 20
      options[:q] = URI.escape(q)
      args = options.map{|k,v| "#{k}=#{v}"}.join('&')
      search_get("/search.json?#{args}")
    end
    
    # Returns the current top 10 trending topics on Twitter.
    def current_trends
      search_get("/trends/current.json")
    end
    
    # Returns the top 20 trending topics for each hour in a given day.
    def daily_trends
      search_get("/trends/daily.json")
    end
    
    # Returns the top 30 trending topics for each day in a given week.
    def weekly_trends
      search_get("/trends/weekly.json")
    end
    
    private
      def search_get(path)
        response = open('http://search.twitter.com' + path, 'User-Agent' => 'github.com/moomerman/twitter_outh')
        JSON.parse(response.read)
      end
  end
end