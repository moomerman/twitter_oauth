require 'open-uri'

module TwitterOAuth
  class Client

    def search(q, options={})
      options[:count] ||= 20
      options[:q] = URI.escape(q)
      args = options.map{|k,v| "#{k}=#{v}"}.join('&')
      get("/search/tweets.json?#{args}")
    end

  end
end