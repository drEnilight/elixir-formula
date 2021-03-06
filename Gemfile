# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.2'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'dotenv-rails', '~> 2.2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.12.2'
gem 'rails', '>= 5.2.4.3'
gem 'whenever', require: false

gem 'omniauth-github', '~> 1.4'

gem 'cld'
gem 'sidekiq', '~> 5.1.3'
gem 'sidekiq-limit_fetch', '~> 3.4.0'
gem 'telegram-bot-ruby', '~> 0.8.6'

gem 'watir', '~> 6.16'
gem 'webdrivers', '~> 4.0'

gem 'bootstrap', '~> 4.0.0'
gem 'jquery-rails'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks'
gem 'uglifier', '>= 2.7.2'

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'pry'
  gem 'rubocop', '~> 0.58.2', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development, :production do
  gem 'capistrano', '~> 3.11'
  gem 'capistrano-rails', '~> 1.4'
  gem 'capistrano-passenger', '~> 0.2.0'
  gem 'capistrano-rbenv', '~> 2.1', '>= 2.1.4'
  gem 'capistrano-sidekiq'
end


group :production do
  gem 'rails_12factor'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
