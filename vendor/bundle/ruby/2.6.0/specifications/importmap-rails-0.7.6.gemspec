# -*- encoding: utf-8 -*-
# stub: importmap-rails 0.7.6 ruby lib

Gem::Specification.new do |s|
  s.name = "importmap-rails".freeze
  s.version = "0.7.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "homepage_uri" => "https://github.com/rails/importmap-rails", "source_code_uri" => "https://github.com/rails/importmap-rails" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["David Heinemeier Hansson".freeze]
  s.date = "2021-09-29"
  s.email = "david@loudthinking.com".freeze
  s.homepage = "https://github.com/rails/importmap-rails".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.3.1".freeze
  s.summary = "Use ESM with importmap to manage modern JavaScript in Rails without transpiling or bundling.".freeze

  s.installed_by_version = "3.0.3.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>.freeze, [">= 6.0.0"])
    else
      s.add_dependency(%q<rails>.freeze, [">= 6.0.0"])
    end
  else
    s.add_dependency(%q<rails>.freeze, [">= 6.0.0"])
  end
end
