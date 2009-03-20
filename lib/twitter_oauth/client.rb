require 'twitter_oauth/account'
require 'twitter_oauth/statuses'
require 'twitter_oauth/direct_messages'

module TwitterOAuth
  class Client
  
    def initialize(options = {})
      @username = options[:username]
      @token = options[:token]
      @secret = options[:secret]
    end
  
    def authorize(token, secret)
      request_token = OAuth::RequestToken.new(
        consumer, token, secret
      )
      @access_token = request_token.get_access_token
      @token = @access_token.token
      @secret = @access_token.secret
      @access_token
    end
  
    def show(username = @username)
      oauth_response = access_token.get("/users/show/#{username}.json")
      JSON.parse(oauth_response.body)
    end
    
    def request_token
      consumer.get_request_token
    end
    
    private
      def consumer
        @consumer ||= OAuth::Consumer.new(
          CLIENT_KEY,
          CLIENT_SECRET,
          { :site=>"http://twitter.com" }
        )
      end

      def access_token
        @access_token ||= OAuth::AccessToken.new(consumer, @token, @secret)
      end
  end
end
   