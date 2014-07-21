# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'text2voice/version'

Gem::Specification.new do |spec|
  spec.name          = "text2voice"
  spec.version       = Text2voice::VERSION
  spec.authors       = ["alitaso345"]
  spec.email         = ["alice.maru345@gmail.com"]
  spec.summary       = %q{VoiceTextAPI}
  spec.description   = %q{This is VoiceTextAPI}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "uri"
  spec.add_development_dependency "net/https"
end
