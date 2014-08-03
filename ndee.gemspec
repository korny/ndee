# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ndee/version'

Gem::Specification.new do |spec|
  spec.name          = "ndee"
  spec.version       = Ndee::VERSION
  spec.authors       = ["Kornelius Kalnbach"]
  spec.email         = ["murphy@rubychan.de"]
  spec.summary       = %q{ndee reads Apache confs and cds into the DocumentRoot of the given domain.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
