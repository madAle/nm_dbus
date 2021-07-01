# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

# Specify your gem's dependencies in nm_dbus.gemspec
gemspec

group :development do
  gem 'rake', '~> 13.0.0'
end

group :test do
  gem 'rspec', '~> 3.10.0'
  gem 'guard', '~> 2.17.0'
  gem 'guard-rspec', '~> 4.7.0'
  gem 'guard-bundler', '~> 3.0.0'
  gem 'simplecov', require: false
  gem 'dotenv', '~> 2.7.6', require: false
end
