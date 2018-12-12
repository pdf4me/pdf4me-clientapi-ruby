$LOAD_PATH << File.expand_path("lib", __dir__)
require "pdf4me/version"

Gem::Specification.new do |spec|
  spec.name          = "pdf4me"
  spec.version       = Pdf4me::VERSION
  spec.authors       = ["arpanlepcha"]
  spec.email         = ["arpanlepcha@gmail.com"]

  spec.summary       = 'Pdf4me Ruby Gem'
  spec.description   = 'RubyClient for Pdf4me API - powered by activemodel'
  spec.homepage      = "http://pdf4me.com/"
  spec.license       = "MIT"

  spec.required_ruby_version = '>= 2.1'
  spec.files = Dir.glob("lib/**/*") + %w|README.md LICENSE.txt|
  spec.test_files    = `git ls-files -- spec/*`.split("\n")
  spec.require_paths = 'lib'

  spec.add_dependency 'typhoeus'
  spec.add_dependency 'json'

  spec.add_development_dependency 'activemodel'
  spec.add_development_dependency 'dotenv'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'shoulda-matchers'
end
