# frozen_string_literal: true

source "https://rubygems.org"

gem 'sinatra'
gem 'sinatra-contrib'
gem 'sinatra-flash', '~> 0.3.0'
gem 'webrick'

group :test do
  gem 'capybara'
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end

group :development, :test do
  gem 'rubocop', '1.20'
end

# gem "rails"