# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'logiga/version'

Gem::Specification.new do |s|
  s.name          = "logiga"
  s.version       = Logiga::VERSION
  s.authors       = ["Geeks at Wego"]
  s.email         = ["therealgeeks@wego.com"]
  s.homepage      = "http://www.wego.com"
  s.summary       = "Wego Logging Module"
  s.description   = "Wego logging module"
  s.required_ruby_version = '>= 1.9.0'

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.add_development_dependency 'rspec', '~> 2.14'
end
