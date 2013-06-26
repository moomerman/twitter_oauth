# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{twitter_oauth}
  s.version = "0.4.94"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Richard Taylor"]
  s.date = %q{2013-06-12}
  s.description = %q{twitter_oauth is a Ruby client for the Twitter API using OAuth.}
  s.email = %q{moomerman@gmail.com}
  s.files = ["LICENSE", "README.textile","lib/twitter_oauth.rb"] + Dir.glob('lib/twitter_oauth/*.rb')
  s.has_rdoc = false
  s.homepage = %q{http://github.com/moomerman/twitter_oauth}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{twitter_oauth}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{twitter_oauth is a Ruby client for the Twitter API using OAuth.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<oauth>, [">= 0.4.7"])
      s.add_runtime_dependency(%q<json>, [">= 1.8.0"])
      s.add_runtime_dependency(%q<mime-types>, [">= 1.16"])
      %w(shoulda mocha).each do |dep|
        s.add_development_dependency dep
      end
    else
      s.add_dependency(%q<oauth>, [">= 0.4.7"])
      s.add_dependency(%q<json>, [">= 1.8.0"])
      s.add_dependency(%q<mime-types>, [">= 1.23"])
    end
  else
    s.add_dependency(%q<oauth>, [">= 0.4.7"])
    s.add_dependency(%q<json>, [">= 1.8.0"])
    s.add_dependency(%q<mime-types>, [">= 1.23"])
  end
end
