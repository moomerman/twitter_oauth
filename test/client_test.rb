require File.join(File.dirname(__FILE__), "/test_helper")

class ClientTest < Test::Unit::TestCase
  include TwitterOAuth

  context "A client instance" do

    setup do
      @client = Client.new
    end

    should "be kind of TwitterOAuth" do
      assert_kind_of TwitterOAuth::Client, @client
    end

  end
end
