set :stage, 'production'
set :branch, 'master'
set :rvm_ruby_version, 'ruby-2.1.2'

# make sure environment variables below are loaded
require 'dotenv'
Dotenv.load!

server ENV['DEPLOY_SERVER'], user: ENV['DEPLOY_USER'], roles: %w{web app db}, port: ENV['DEPLOY_PORT']
