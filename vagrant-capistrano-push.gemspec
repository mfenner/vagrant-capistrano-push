# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vagrant-capistrano-push/version'

Gem::Specification.new do |spec|
  spec.name          = "vagrant-capistrano-push"
  spec.version       = VagrantPlugins::CapistranoPush::VERSION
  spec.platform      = Gem::Platform::RUBY
  spec.authors       = ["Martin Fenner"]
  spec.email         = "mf@martinfenner.org"
  spec.summary       = "Use capistrano with vagrant push."
  spec.description   = "Use capistrano with the vagrant push command."
  spec.homepage      = "http://www.vagrantup.com"
  spec.license       = "MIT"

  spec.required_rubygems_version = ">= 1.3.6"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "vagrant-spec", "~> 1.4.0"
  spec.add_development_dependency "rspec", "~> 3.1.0"

  spec.files         = Dir.glob("lib/**/*.rb")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
end
