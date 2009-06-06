require 'rubygems'
require 'test/unit'
require 'shoulda'

lib_files = File.join(File.dirname(__FILE__), "..", "lib")

Dir.glob(File.join(lib_files, "**")).each do |file|
  require file
end
