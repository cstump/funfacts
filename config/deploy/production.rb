set :stage, 'production'
set :branch, 'master'
set :rvm_ruby_version, 'ruby-2.1.2'

server ENV['DEPLOY_SERVER'], user: ENV['DEPLOY_USER'], roles: %w{web app db}, port: ENV['DEPLOY_PORT']
