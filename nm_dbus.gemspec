# frozen_string_literal: true
require_relative 'lib/nm_dbus/version'

Gem::Specification.new do |spec|
  spec.name          = 'nm_dbus'
  spec.version       = NmDbus::VERSION
  spec.authors       = ['Alessandro Verlato']
  spec.email         = ['alessandro@fancypixel.it']

  spec.summary       = 'NetworkManager D-Bus client'
  spec.homepage      = 'https://github.com/madAle/nm_dbus'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.4.0')

  spec.files         = Dir['README.md', 'MIT-LICENSE', 'lib/**/*.rb']

  spec.add_dependency 'zeitwerk',   '~> 2.4.0'
  spec.add_dependency 'rexml'
  spec.add_dependency 'ruby-dbus',  '~> 0.16.0'
end
