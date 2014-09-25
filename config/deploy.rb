# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'funfacts'
set :repo_url, 'git@github.com:cstump/funfacts.git'
set :linked_files, %w{config/database.yml config/secrets.yml}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets}
set :unicorn_config_path, File.join(release_path, 'config', 'unicorn.rb')
set :bundle_flags, '--deployment --quiet --binstubs'

after 'deploy:publishing', 'deploy:restart'
