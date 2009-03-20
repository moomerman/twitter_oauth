require 'rubygems'
require 'oauth'
require 'json'

require 'twitter_oauth/client'

module TwitterOAuth
  def self.version
    yml = YAML.load(File.read(File.join(File.dirname(__FILE__), *%w[.. VERSION.yml])))
    "#{yml[:major]}.#{yml[:minor]}.#{yml[:patch]}"
  end
end