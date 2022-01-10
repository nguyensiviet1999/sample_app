# Puma can serve each request in a thread from an internal thread pool.
# The `threads` method setting takes two numbers: a minimum and maximum.
# Any libraries that use thread pools should be configured to match
# the maximum value specified for Puma. Default is set to 5 threads for minimum
# and maximum; this matches the default thread size of Active Record.
#
workers 1
max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
threads min_threads_count, max_threads_count

# Specifies the `port` that Puma will listen on to receive requests; default is 3000.
#
port ENV.fetch("PORT") { 80 }

# Specifies the `environment` that Puma will run in.
#
environment ENV['RAILS_ENV'] || "production"
bind "unix://#{shared_dir}/sockets/puma.sock"
# Specifies the `pidfile` that Puma will use.
pidfile ENV.fetch("PIDFILE") { "tmp/pids/server.pid" }
state_path "#{shared_dir}/pids/puma.state"
activate_control_app
# Specifies the number of `workers` to boot in clustered mode.
# Workers are forked web server processes. If using threads and workers together
# the concurrency of the application would be max `threads` * `workers`.
# Workers do not work on JRuby or Windows (both of which do not support
# processes).
#
# workers ENV.fetch("WEB_CONCURRENCY") { 2 }

# Use the `preload_app!` method when specifying a `workers` number.
# This directive tells Puma to first boot the application and load code
# before forking the application. This takes advantage of Copy On Write
# process behavior so workers use less memory.
#
# preload_app!
preload_app!

rackup DefaultRackup
on_worker_boot do
  require "active_record"
  ActiveRecord::Base.connection.disconnect! rescue ActiveRecord::ConnectionNotEstablished
  ActiveRecord::Base.establish_connection
end
if ENV["RAILS_ENV"] == "production"
  key_file = Rails.root.join("config", "certs", "localhost-key.pem")
  cert_file = Rails.root.join("config", "certs", "localhost.pem")

  if key_file.exist?
    ssl_bind "65.2.40.39", "443", {
               key: "config/certs/localhost-key.pem",
               cert: "config/certs/server.crt",
               verify_mode: "none",
             }
  else
    bind "tcp://65.2.40.39/:443"
  end
end
# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart
