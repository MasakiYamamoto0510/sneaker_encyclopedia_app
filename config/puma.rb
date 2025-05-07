# Puma can serve each request in a thread from an internal thread pool.
# The `threads` method setting takes two numbers: a minimum and maximum.
# Any libraries that use thread pools should be configured to match
# the maximum value specified for Puma. Default is set to 5 threads for minimum
# and maximum; this matches the default thread size of Active Record.
#
max_threads_count = ENV.fetch("RAILS_MAX_THREADS", 5)
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
threads min_threads_count, max_threads_count

# Specifies the `worker_timeout` threshold that Puma will use to wait before
# terminating a worker in development environments.
#
worker_timeout 3600 if ENV.fetch("RAILS_ENV", "development") == "development"

# Specifies the `port` that Puma will listen on to receive requests; default is 3000.
#
port ENV.fetch("PORT", 3000)

# Specifies the `environment` that Puma will run in.
#
environment ENV.fetch("RAILS_ENV") { "development" }

# Specifies the `pidfile` that Puma will use.
pidfile ENV.fetch("PIDFILE", "tmp/pids/server.pid")

# Specifies the number of `workers` to boot in clustered mode.
# Workers are forked web server processes. If using threads and workers together
# the concurrency of the application would be max `threads` * `workers`.
# Workers do not work on JRuby or Windows (both of which do not support processes).
#
# workers ENV.fetch("WEB_CONCURRENCY") { 2 }

# Use the `preload_app!` method when specifying a `workers` number.
# This directive tells Puma to first boot the application and load code
# before forking the application. This takes advantage of Copy On Write
# process behavior so workers use less memory.
#
# preload_app!

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart

# ─────────────────────────────────────────────
# Production 専用設定（Rails 6/Puma 6 対応済み）
# ─────────────────────────────────────────────
if ENV["RAILS_ENV"] == "production"
  # Socket 通信用（Nginx 経由などで使う場合）
  bind "unix://#{Dir.pwd}/tmp/sockets/puma.sock"

  # プロセスIDと状態の保存先
  pidfile File.join(Dir.pwd, "tmp", "pids", "puma.pid")
  state_path File.join(Dir.pwd, "tmp", "pids", "puma.state")

  # ログ出力設定
  stdout_redirect(
    File.join(Dir.pwd, "log", "puma.log"),
    File.join(Dir.pwd, "log", "puma-error.log"),
    true
  )

  # バックグラウンドで起動（GitHub Actionsとの連携に必要）
  # Puma 6 では daemonize DSL が廃止されています
  # GitHub Actions の起動コマンドに -d を付けました
  # + RAILS_ENV=production ~/.rbenv/shims/bundle exec puma -C config/puma.rb -d
  #daemonize
end
