source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'rails', '~> 6.1.7', '>= 6.1.7.4'
gem 'haml', '~> 6.1', '>= 6.1.1'
gem 'select2-rails', '~> 4.0', '>= 4.0.13'
gem 'acts-as-taggable-on'

gem 'sqlite3', '~> 1.4'
gem 'sidekiq'
gem 'httparty'
gem 'activeadmin'
# gem 'will_paginate', '~> 4.0'
gem 'kaminari'
gem 'devise', '~> 4.9'

gem 'cancancan', '~> 3.5'
gem 'pry'
gem 'bootstrap', '~> 5.2', '>= 5.2.3'

gem 'puma', '~> 5.0'

gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'redis', '~> 4.0'
gem 'jquery-rails'
gem 'rspec'
gem 'sidekiq-scheduler'
# gem 'bcrypt', '~> 3.1.7'

# gem 'image_processing', '~> 1.2'

gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  gem 'rspec-rails'
  gem 'rails-controller-testing'
  gem 'factory_bot_rails'
  gem 'simplecov', require: false
  gem 'faker'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'letter_opener'

  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver', '>= 4.0.0.rc1'

  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem "hotwire-rails", "~> 0.1.3"

gem "ransack", "~> 4.0"