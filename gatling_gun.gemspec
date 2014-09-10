lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gatling_gun.rb'

Gem::Specification.new do |s|
  s.name        = "gatling_gun"
  s.version     = GatlingGun::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["James Edward Gray II"]
  s.email       = ["james@graysoftinc.com"]
  s.homepage    = "https://github.com/okrb/gatling_gun"
  s.summary     = "A Ruby library wrapping SendGrid's Newsletter API."
  s.description = <<-END_DESCRIPTION.gsub(/\s+/, " ").strip
  A library for working with SendGrid's Newsletter API.  The code is intended
  for managing and sending newletters.
  END_DESCRIPTION

  s.required_ruby_version     = ">= 1.9.2"
  s.required_rubygems_version = ">= 1.3.7"

  s.files         = `git ls-files`.split("\n")
  # s.test_files    = `git ls-files -- test/*.rb`.split("\n")
  s.require_paths = %w[lib]
end
