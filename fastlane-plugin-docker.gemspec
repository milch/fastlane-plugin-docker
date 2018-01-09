# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/docker/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-docker'
  spec.version       = Fastlane::Docker::VERSION
  spec.version       = "#{spec.version}-alpha-#{ENV['TRAVIS_BUILD_NUMBER']}" if ENV['TRAVIS']
  spec.author        = 'Manu Wallner'
  spec.email         = 'manu@supermil.ch'

  spec.summary       = 'fastlane Actions to support building images, logging into Docker Hub, and pushing those images to the Hub'
  spec.homepage      = "https://github.com/milch/fastlane-plugin-docker"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"] + %w(README.md LICENSE)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  # spec.add_dependency 'your-dependency', '~> 1.0.0'

  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop', '0.49.1'
  spec.add_development_dependency 'fastlane', '>= 1.107.0'
end
