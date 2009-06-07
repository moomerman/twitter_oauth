require File.join(File.dirname(__FILE__), "/test_helper")
require 'mocha'

class ClientTest < Test::Unit::TestCase
  include TwitterOAuth

  context "A client instance" do

    setup do
      @client = Client.new
    end

    should "be kind of TwitterOAuth" do
      assert_kind_of TwitterOAuth::Client, @client
    end

    context "when authorizing" do
      setup do
        @request_token = stub('a request token')
        @access_token = stub_everything('access token')
        @request_token.stubs(:get_access_token).returns(@access_token)
        OAuth::RequestToken.stubs(:new).returns(@request_token)
      end

      should "return an access token" do
        assert_equal @client.authorize("haha","haha"), @access_token
      end
    end

  end
end
