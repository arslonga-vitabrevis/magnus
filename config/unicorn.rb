
#サーバ上でのアプリケーションコードが設置されているディレクトリを変数に格納
app_path = File.expand_path('../../../', __FILE__)
#アプリケーションサーバーの性能を決める(レスポンスを生成するworkerの数)
worker_processes 1
#アプリケーションの設置されているディレクトリを指定
working_directory app_path
#Unicornの起動に必要なファイルの設置場所
pid "#{app_path}/shared/tmp/pids/unicorn.pid"
#ポート番号の指定
listen "#{app_path}/shared/tmp/sockets/unicorn.sock"
#エラーログを記録するファイルを指定
stderr_path "#{app_path}/shared/log/unicorn.stderr.log"
#通常のログを記録するファイルを指定
stdout_path "#{app_path}/shared/log/unicorn.stdout.log"
#Railsアプリの応答を待つ上限時間
timeout 60


preload_app true
GC.respond_to?(:copy_on_write_friendly=) && GC.copy_on_write_friendly = true

check_client_connection false

run_once = true

before_fork do |server, worker|
  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.connection.disconnect!
  
  if run_once
    run_once = false #prevent from firing again
  end

  old_pid = "#{server.config[:pid]}.oldbin"
    if File.exist?(old_pid) && server.pid != old_pid
      begin
        sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
        Process.kill(sig, FIle.read(old_pid).to_i)
      rescue Errno::ENOENT, Errno::ESRCH => e
        logger.error e
      end
    end
  end

after_fork do |_server, _worker|
  defined?(ActiveRecord::Base) && ActiveRecord::Base.establish_connection
end