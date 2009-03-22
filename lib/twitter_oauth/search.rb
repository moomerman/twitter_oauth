require 'open-uri'
require 'ostruct'

module TwitterOAuth
  class Client
    
    def search(q, page = 1, per_page = 20)
      response = open("http://search.twitter.com/search.json?q=#{URI.escape(q)}&page=#{page}&rpp=#{per_page}")
      search_result = JSON.parse(response.read)
      search_result = OpenStruct.new(search_result)
      search_result.results = search_result.results.collect{|x| OpenStruct.new(x)}
      search_result
    end
  
  end
end