rails_env = ENV['RAILS_ENV'] || 'production'

threads 4,4

bind  "unix:///home/ielt/shared/socket fail_timeout=0"
pidfile "/home/ielt/shared/pids/puma.pid"
state_path "/home/ielt/shared/state"

activate_control_app