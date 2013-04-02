# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rubygems/lock/version'

Gem::Specification.new do |spec|
  spec.name          = "rubygems-lock"
  spec.version       = Rubygems::Lock::VERSION
  spec.authors       = ["Ryan Souza"]
  spec.email         = ["ryan@ryansouza.net"]
  spec.description   = %q{Use Gemfile and Gemfile.lock with CLI rubygems}
  spec.summary       = %q{CLI rubygems are applications too. Make sure your users have the experience you developed, with real dependency handling, free from version mismatches.}
  spec.homepage      = "https://github.com/ryansouza/rubygems-lock"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^(test)/})
  spec.require_paths = ["lib"]

  # Verified with 1.0 through 1.3
  spec.add_dependency "bundler", "~> 1.0"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
end
