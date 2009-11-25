require 'rake/testtask'
require 'shoulda/tasks'


task :default => ["test:units"]

desc "Run basic tests"
Rake::TestTask.new("test:units") { |t|
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
  t.warning = true
}
