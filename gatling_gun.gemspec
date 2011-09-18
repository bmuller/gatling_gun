DIR     = File.dirname(__FILE__)
LIB     = File.join(DIR, *%w[lib gatling_gun.rb])
VERSION = open(LIB) { |lib|
  lib.each { |line|
    if v = line[/^\s*VERSION\s*=\s*(['"])(\d\.\d\.\d)\1/, 2]
      break v
    end
  }
}

SPEC = Gem::Specification.new do |s|
  s.name        = "gatling_gun"
  s.version     = VERSION
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
