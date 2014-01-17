set :application, 'treasure'
set :repo_url, 'git@github.com:morgane/treasure.git'

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :deploy_to, '/home/ec2-user/treasure'
set :scm, :git

# set :format, :pretty
# set :log_level, :debug
set :pty, true

# set :linked_files, %w{config/database.yml}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
# set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app) do
      run "kill -s USR2 `cat /tmp/unicorn.treasure.pid`"
    end
  end

  desc "Start unicorn"
  task :start, :except => { :no_release => true } do
    on roles(:app) do
      run "cd #{current_path} ; bundle exec unicorn_rails -c config/unicorn.rb -D -E production"
    end
  end

  desc "Stop unicorn"
  task :stop, :except => { :no_release => true } do
    on roles(:app) do
      run "kill -s QUIT `cat /tmp/unicorn.treasure.pid`"
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :finishing, 'deploy:cleanup'

end
