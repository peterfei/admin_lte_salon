source 'https://ruby.taobao.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'slim-rails'
gem "bower-rails"
#用户登陆
gem 'devise'
gem 'mysql2'
#分页
gem 'kaminari'
#面包屑
gem "breadcrumbs_on_rails"
gem 'rails-i18n'
gem 'simple_form'
gem 'pry-rails'
gem 'pry-nav'
gem 'pry'

# gem 'client_side_validations',branch:'rails5',git:"https://github.com/DavyJonesLocker/client_side_validations.git"
# gem 'client_side_validations-simple_form',branch:'rails5'
gem 'client_side_validations',
    github: 'DavyJonesLocker/client_side_validations',
    branch: 'rails5'
gem 'client_side_validations-simple_form',
    github: 'DavyJonesLocker/client_side_validations-simple_form',
    branch: 'rails5'

gem 'mina'

gem 'mina-puma', :require => false
gem 'puma', '~> 3.0'
gem 'listen', '~> 3.1.5'

gem 'axlsx'
##搜索
gem 'ransack'
