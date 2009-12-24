require 'open-uri'
require 'ostruct'

module TwitterOAuth
  class Client
    
    def search(q, options={})
      options[:page] ||= 1
      options[:per_page] ||= 20
      response = open("http://search.twitter.com/search.json?q=#{URI.escape(q)}&page=#{options[:page]}&rpp=#{options[:per_page]}&since_id=#{options[:since_id]}")
      search_result = JSON.parse(response.read)
      search_result = OpenStruct.new(search_result)
      search_result.results = search_result.results.collect{|x| OpenStruct.new(x)}
      search_result
    end
    
    # Returns the current top 10 trending topics on Twitter.
    def current_trends
      response = open("http://search.twitter.com/trends/current.json")
      JSON.parse(response.read)
    end
    
    # Returns the top 20 trending topics for each hour in a given day.
    def daily_trends
      response = open("http://search.twitter.com/trends/daily.json")
      JSON.parse(response.read)
    end
    
    # Returns the top 30 trending topics for each day in a given week.
    def weekly_trends
      response = open("http://search.twitter.com/trends/weekly.json")
      JSON.parse(response.read)
    end
    
  end
end