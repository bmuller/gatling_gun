$:.push File.expand_path("../lib", __FILE__)
require 'gatling_gun'

Gem::Specification.new do |s|
  s.name        = "gatling_gun"
  s.version     = GatlingGun::VERSION
  s.authors     = ["James Edward Gray II", "Brian Muller"]
  s.email       = ["bamuller@gmail.com"]
  s.homepage    = "https://github.com/bmuller/gatling_gun"
  s.summary     = "A Ruby library wrapping SendGrid's Newsletter API."
  s.description = "A Ruby library wrapping SendGrid's Newsletter API."

  s.files         = `git ls-files`.split("\n")
  s.require_paths = %w[lib]
  s.add_development_dependency('rdoc')
end
