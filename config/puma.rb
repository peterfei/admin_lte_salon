#!/usr/bin/env puma

environment ENV['RAILS_ENV'] || 'development'

daemonize true

pidfile "//home/deploy/current/tmp/pids/puma.pid"
stdout_redirect "//home/deploy/current/log/stdout", "//home/deploy/current/log/stderr"

threads 0, 16

bind "unix:///tmp/salon.sock"