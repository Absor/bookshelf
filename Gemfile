source 'https://rubygems.org'

ruby '2.1.1'

gem 'rails', '4.1.0'
gem 'rails-api'

gem 'coveralls', require: false
gem 'devise'
gem 'pundit'
gem 'aes'
gem 'googlebooks'

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails', '~> 3.0.0.beta'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :development do
  gem 'rack-cors'
end

group :test do
  gem 'capybara'
  gem 'poltergeist'
  gem 'launchy'
  gem 'compass'
  gem 'simplecov', '0.7.1'
  gem 'database_cleaner'
  gem "factory_girl_rails", "~> 4.0"
  gem 'webmock'
end