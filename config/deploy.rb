# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'funfacts'
set :repo_url, 'git@github.com:cstump/funfacts.git'
set :linked_files, %w{config/database.yml config/secrets.yml}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets}
set :unicorn_config_path, File.expand_path('./server/unicorn.rb', __dir__)
set :nginx_template, File.expand_path('./server/nginx.conf', __dir__)

after 'deploy:publishing', 'deploy:restart'
