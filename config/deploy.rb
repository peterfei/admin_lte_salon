require 'mina/rails'
require 'mina/git'
require 'mina/bundler'
require 'mina/rvm'
require 'mina/puma'
#服务器地址,是使用ssh的方式登录服务器
set :domain, 'deploy@115.28.247.59'
#服务器中项目部署位置
set :deploy_to, '/home/deploy/salon'
set :rvm_path, '/usr/local/rvm/scripts/rvm'
set :bundle_gemfile, "app/Gemfile"
set :rails_env, 'development'

#git代码仓库
set :repository, 'https://github.com/peterfei/admin_lte_salon.git'
#git分支
set :branch, 'master'

# 中括号里的文件 会出现在服务器项目附录的shared文件夹中，这里加入了secrets.yml，环境密钥无需跟开发计算机一样
set :shared_paths, ['config/database.yml', 'log', 'config/secrets.yml','log', 'tmp', 'public/uploads']
task :environment do
  # 如果使用的是rbenv,这么设置,但需确保.rbenv-version(rbenv local 1.9.3-p374)已经存在于你的项目中
  invoke :'rvm:use[ruby-2.2.6@default]'


  # 如果使用rvm，可以这样加载一个RVM version@gemset
  # invoke :'rvm:use[ruby-1.9.3-p374@default]'
end

# 这个块里面的代码表示运行 mina setup时运行的命令
task :setup => :environment do

  # 在服务器项目目录的shared中创建log文件夹
  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/log"]

  # 在服务器项目目录的shared中创建config文件夹 下同
  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/config"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/config"]

  queue! %[touch "#{deploy_to}/#{shared_path}/config/database.yml"]
  queue! %[touch "#{deploy_to}/#{shared_path}/config/secrets.yml"]

  # puma.rb 配置puma必须得文件夹及文件
  queue! %[mkdir -p "#{deploy_to}/shared/tmp/pids"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/tmp/pids"]

  queue! %[mkdir -p "#{deploy_to}/shared/tmp/sockets"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/tmp/sockets"]

  queue! %[touch "#{deploy_to}/shared/config/puma.rb"]
  queue  %[echo "-----> Be sure to edit 'shared/config/puma.rb'."]

  # tmp/sockets/puma.state
  queue! %[touch "#{deploy_to}/shared/tmp/sockets/puma.state"]
  queue  %[echo "-----> Be sure to edit 'shared/tmp/sockets/puma.state'."]

  # log/puma.stdout.log
  queue! %[touch "#{deploy_to}/shared/log/puma.stdout.log"]
  queue  %[echo "-----> Be sure to edit 'shared/log/puma.stdout.log'."]

  # log/puma.stdout.log
  queue! %[touch "#{deploy_to}/shared/log/puma.stderr.log"]
  queue  %[echo "-----> Be sure to edit 'shared/log/puma.stderr.log'."]

  queue  %[echo "-----> Be sure to edit '#{deploy_to}/#{shared_path}/config/database.yml'."]
end

#这个代码块表示运行 mina deploy时执行的命令
desc "Deploys the current version to the server."
task :deploy => :environment do
  to :before_hook do
  end
  deploy do
    #重新拉git服务器上的最新版本，即使没有改变
    invoke :'git:clone'
    #重新设定shared_path位置
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_create'
    invoke :'rails:db_migrate'
    # invoke :'rails:assets_precompile'

    to :launch do
      # invoke :'puma:restart'
      # queue "mkdir -p #{deploy_to}/#{current_path}/tmp/"
      invoke :'puma:phased_restart'
      # queue "chown -R www-data #{deploy_to}"
      # queue "touch #{deploy_to}/#{current_path}/tmp/restart.txt"
    end
    invoke :'deploy:cleanup'
  end
end
namespace :puma do
  desc "Start the application"
  task :start do
    queue 'echo "-----> Start Puma"'
    queue "cd #{deploy_to}/current && RAILS_ENV=#{rails_env} && bin/puma.sh start"
  end

  desc "Stop the application"
  task :stop do
    queue 'echo "-----> Stop Puma"'
    queue "cd #{deploy_to}/current && RAILS_ENV=#{rails_env} && bin/puma.sh stop"
  end

  desc "Restart the application"
  task :restart do
    queue 'echo "-----> Restart Puma"'
    queue "cd #{deploy_to}/current && RAILS_ENV=#{rails_env} && bin/puma.sh restart"
  end
end
