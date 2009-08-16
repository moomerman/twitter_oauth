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
  
  end
end