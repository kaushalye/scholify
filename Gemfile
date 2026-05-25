source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.3.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 7.1'
# Use sqlite3 as the database for Active Record
#gem 'sqlite3'
gem 'pg'
# Use Puma as the app server
gem 'puma'
# Use SCSS for stylesheets
gem 'sassc-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

# For heroku
gem 'mini_portile2'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'minitest'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  gem 'listen', '~> 3.8'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.1'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  #gem 'chromedriver-helper'
  gem 'webdrivers'
  gem 'rails-controller-testing'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'bootstrap', '~> 5.3.2'

gem 'bootstrap-social-rails'

gem 'jquery-rails'
gem 'jquery-datatables-rails', git: 'https://github.com/rweng/jquery-datatables-rails.git'

gem "execjs", "2.8.1"

gem 'prawn'
gem 'prawn-table'

# Force ffi >= 1.17.0 for arm64/Apple Silicon + Ruby 3.3 compatibility (ffi < 1.16 fails to compile)
gem 'ffi', '>= 1.17.0'

gem "omniauth", "~> 2.1"
gem "omniauth-rails_csrf_protection"
gem 'devise'
gem 'cancancan'#, '~> 1.10'
gem 'rolify'
gem "omniauth-google-oauth2", "~> 1.1"
gem 'font-awesome-rails'

# Impersonate User
gem 'pretender'



gem 'will_paginate', '~> 3.3'