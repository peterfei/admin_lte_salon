#!/usr/bin/env puma

environment ENV['RAILS_ENV'] || 'development'

daemonize true


#下面都是 puma的配置项
pidfile "#{application_path}/shared/tmp/pids/salon.pid"
state_path "#{application_path}/shared/tmp/sockets/salon.state"
stdout_redirect "#{application_path}/shared/log/puma.stdout.log", "#{application_path}/shared/log/puma.stderr.log"
bind "unix://#{application_path}/shared/tmp/sockets/#{app_name}.sock"



threads 0, 16

