# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/docker/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-docker'
  spec.version       = Fastlane::Docker::VERSION
  spec.author        = %q{Manu Wallner}
  spec.email         = %q{manu@supermil.ch}

  spec.summary       = %q{fastlane Actions to support building images, logging into Docker Hub, and pushing those images to the Hub}
  spec.homepage      = "https://github.com/milch/fastlane-docker"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"] + %w(README.md LICENSE)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  # spec.add_dependency 'your-dependency', '~> 1.0.0'

  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'fastlane', '>= 1.107.0'
end
