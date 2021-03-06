# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cdl/version'

Gem::Specification.new do |spec|
  spec.name          = "cdl"
  spec.version       = Cdl::VERSION
  spec.authors       = ["Nicolas Duval"]
  spec.email         = ["nduval.dev@gmail.com"]
  spec.description   = %q{Color Decision List (ASC CDL) parser}
  spec.summary       = %q{Color Decision List (ASC CDL) parser}
  spec.homepage      = "https://github.com/nicolasduval/cdl"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
