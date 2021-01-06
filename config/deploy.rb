# config valid for current version and patch releases of Capistrano
lock "~> 3.15.0"

#アプリ名（ログ表示用）
set :application, "magnus"

#pullするレポジトリURL
set :repo_url, "git@github.com:arslonga-vitabrevis/magnus.git"

# Default branch is :master（デフォルトブランチ）
set :brunch, 'master'
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/www/magnus"

#バージョン管理の形式
set :scm, 'git'

#バージョンが変わっても共通で参照するディレクトリ
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public_uploads')

# rubyのバージョン
set :rbenv_type, :user
set :rbenv_ruby, '2.6.5'

#どの公開鍵を使うか
set :ssh_options, auth_methods: ['publicley'], keys: ['~/.ssh/magnus_key.pem']

#プロセス番号を記載したファイルの場所
set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }

#Unicorn設定ファイルの場所
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }

#前のバージョンのファイルのいくつ残すか
set :keep_releases, 5

#デプロイ後のUnicornの再起動タスク
after 'deploying:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false (仮想端末でsudoするのに必要？)
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
