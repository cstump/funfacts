source 'https://rubygems.org'

# application
gem 'rails', '4.1.6'
gem 'pg'
gem 'hashie'
gem 'soda-ruby', require: 'soda'
gem 'kaminari'
gem 'haml-rails'

# production
gem 'thin'
gem 'whenever', require: false
gem 'capistrano',  '~> 3.1'
gem 'capistrano-rails', '~> 1.1'
gem 'therubyracer',  platforms: :ruby

# assets
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'bootstrap-sass'
gem 'autoprefixer-rails'
gem 'jquery-rails'
gem 'turbolinks'

group :development do
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'pry-rails'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :test do
  gem 'vcr'
  gem 'webmock'
  gem 'shoulda-matchers', require: false
end

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'awesome_print'
  gem 'faker'
end
