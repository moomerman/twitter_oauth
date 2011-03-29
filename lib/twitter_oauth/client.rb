require 'twitter_oauth/timeline'
require 'twitter_oauth/status'
require 'twitter_oauth/account'
require 'twitter_oauth/direct_messages'
require 'twitter_oauth/search'
require 'twitter_oauth/notifications'
require 'twitter_oauth/blocks'
require 'twitter_oauth/friendships'
require 'twitter_oauth/user'
require 'twitter_oauth/favorites'
require 'twitter_oauth/utils'
require 'twitter_oauth/trends'
require 'twitter_oauth/lists'
require 'twitter_oauth/saved_searches'
require 'twitter_oauth/spam'
require 'twitter_oauth/geo'

module TwitterOAuth
  class Client
    
    def initialize(options = {})
      @consumer_key = options[:consumer_key]
      @consumer_secret = options[:consumer_secret]
      @token = options[:token]
      @secret = options[:secret]
      @request_endpoint = options[:request_endpoint]
      @proxy = options[:proxy]
    end
  
    def authorize(token, secret, options = {})
      request_token = OAuth::RequestToken.new(
        consumer, token, secret
      )
      @access_token = request_token.get_access_token(options)
      @token = @access_token.token
      @secret = @access_token.secret
      @access_token
    end
  
    def show(username)
      get("/users/show/#{username}.json")
    end
    
    # Returns the string "ok" in the requested format with a 200 OK HTTP status code.
    def test
      get("/help/test.json")
    end
    
    def request_token(options={})
      consumer.get_request_token(options)
    end
    
    def authentication_request_token(options={})
      consumer.options[:authorize_path] = '/oauth/authenticate'
      request_token(options)
    end
    
    private
    
      def consumer
        options = { :site => 'http://api.twitter.com' }
        options.update( :request_endpoint => @request_endpoint ) if @request_endpoint
        options.update( :proxy => @proxy ) if @proxy
        @consumer ||= OAuth::Consumer.new(
          @consumer_key,
          @consumer_secret,
          options
        )
      end

      def access_token
        @access_token ||= OAuth::AccessToken.new(consumer, @token, @secret)
      end
      
      def get(path, headers={})
        headers.merge!("User-Agent" => "twitter_oauth gem v#{TwitterOAuth::VERSION}")
        oauth_response = access_token.get("/1#{path}", headers)
        JSON.parse(oauth_response.body)
      end

      def post(path, body='', headers={})
        headers.merge!("User-Agent" => "twitter_oauth gem v#{TwitterOAuth::VERSION}")
        oauth_response = access_token.post("/1#{path}", body, headers)
        JSON.parse(oauth_response.body)
      end

      def delete(path, headers={})
        headers.merge!("User-Agent" => "twitter_oauth gem v#{TwitterOAuth::VERSION}")
        oauth_response = access_token.delete("/1#{path}", headers)
        JSON.parse(oauth_response.body)
      end
  end
end
   
