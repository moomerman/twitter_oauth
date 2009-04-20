require 'twitter_oauth/account'
require 'twitter_oauth/statuses'
require 'twitter_oauth/direct_messages'
require 'twitter_oauth/search'
require 'twitter_oauth/notifications'
require 'twitter_oauth/blocks'
require 'twitter_oauth/friendships'
require 'twitter_oauth/user'
require 'twitter_oauth/favorites'
require 'twitter_oauth/utils'

module TwitterOAuth
  class Client
    
    def initialize(options = {})
      @consumer_key = options[:consumer_key]
      @consumer_secret = options[:consumer_secret]
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
  
    def show(username)
      oauth_response = access_token.get("/users/show/#{username}.json")
      JSON.parse(oauth_response.body)
    end
    
    def request_token
      consumer.get_request_token
    end
    
    private
      def consumer
        @consumer ||= OAuth::Consumer.new(
          @consumer_key,
          @consumer_secret,
          { :site=>"http://twitter.com" }
        )
      end

      def access_token
        @access_token ||= OAuth::AccessToken.new(consumer, @token, @secret)
      end
  end
end
   
