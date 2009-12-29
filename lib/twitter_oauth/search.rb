require 'open-uri'

module TwitterOAuth
  class Client
    
    def search(q, options={})
      options[:page] ||= 1
      options[:per_page] ||= 20
      search_get("http://search.twitter.com/search.json?q=#{URI.escape(q)}&page=#{options[:page]}&rpp=#{options[:per_page]}&since_id=#{options[:since_id]}")
    end
    
    # Returns the current top 10 trending topics on Twitter.
    def current_trends
      search_get("http://search.twitter.com/trends/current.json")
    end
    
    # Returns the top 20 trending topics for each hour in a given day.
    def daily_trends
      search_get("http://search.twitter.com/trends/daily.json")
    end
    
    # Returns the top 30 trending topics for each day in a given week.
    def weekly_trends
      search_get("http://search.twitter.com/trends/weekly.json")
    end
    
    private
      def search_get(url)
        response = open(url, 'User-Agent' => 'github.com/moomerman/twitter_outh')
        JSON.parse(response.read)
      end
  end
end