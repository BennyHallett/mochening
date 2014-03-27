# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mochening/version'

Gem::Specification.new do |spec|
  spec.name          = "mochening"
  spec.version       = Mochening::VERSION
  spec.authors       = ["Benny Hallett"]
  spec.email         = ["benny.hallett@gmail.com"]
  spec.description   = %q{Mochening allows simpler mocking of Sequel database objects with Mocha.}
  spec.summary       = %q{Mochening makes mocking Sequel database objects with Mocha simpler}
  spec.homepage      = "http://github.com/bennyhallett/mochening"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec-mocks'
end
