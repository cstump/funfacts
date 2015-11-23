source 'https://rubygems.org'

gem 'rails', '4.2.0'
gem 'mysql2'
gem 'hashie'
gem 'soda-ruby', require: 'soda'
gem 'kaminari'
gem 'faraday'
gem 'nokogiri'
gem 'active_model_serializers'

# assets
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'bootstrap-sass'
gem 'autoprefixer-rails'
gem 'react-rails', '~> 1.0'

# production
gem 'unicorn'
gem 'whenever', require: false
gem 'therubyracer',  platforms: :ruby

group :development do
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'better_errors'
  gem 'binding_of_caller'

  # deployment
  gem 'capistrano', '3.2.1'
  gem 'capistrano-rvm'
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano3-unicorn'
end

group :test do
  gem 'vcr'
  gem 'webmock'
  gem 'simplecov', require: false
  gem 'shoulda-matchers', require: false
end

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'awesome_print'
  gem 'faker'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'dotenv-rails'
end
