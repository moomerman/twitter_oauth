module TwitterOAuth
  class Client
  
    def initialize(options = {})
      @username = options[:username]
      @token = options[:token]
      @secret = options[:secret]
    end
  
    def show(username = @username)
      oauth_response = access_token.get("/users/show/#{username}.json")
      JSON.parse(oauth_response.body)
    end
  
    def authorized?
      oauth_response = access_token.get('/account/verify_credentials.json')
      return oauth_response.class == Net::HTTPOK
    end
  
    def friends
      oauth_response = access_token.get('/statuses/friends_timeline.json')
      JSON.parse(oauth_response.body)
    end
  
    def update(message)
      oauth_response = access_token.post('/statuses/update.json', :status => message)
      JSON.parse(oauth_response.body)
    end
  
    def message(user, text)
      oauth_response = access_token.post('/direct_messages/new.format', :user => user, :text => text)
      JSON.parse(oauth_response.body)
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
   