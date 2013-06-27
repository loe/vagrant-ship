# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vagrant/ship/version'

Gem::Specification.new do |spec|
  spec.name          = "vagrant-ship"
  spec.version       = Vagrant::Ship::VERSION
  spec.authors       = ["W. Andrew Loe III"]
  spec.email         = ["andrew@andrewloe.com"]
  spec.description   = %q{Export a Vagrant box as an OVF.}
  spec.summary       = %q{Export a Vagrant box as an OVF.}
  spec.homepage      = "https://github.com/loe/vagrant-ship"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
