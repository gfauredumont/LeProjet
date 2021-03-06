source 'https://rubygems.org'
ruby "2.3.1"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'

##### FRONT

gem "haml-rails", "~> 0.9"
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby



##### 3rd parties

gem 'octokit', '~> 4.3'
gem 'devise', '~> 4.2'
gem 'omniauth-facebook', '~> 4.0'
gem 'omniauth-github', '~> 1.1', '>= 1.1.2'

gem 'administrate', '~> 0.3.0'
# Needed for workaround on Administrate bug
gem 'bourbon', '~> 4.2.7'


##### BACK

gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.0'

# # Use jquery as the JavaScript library
# gem 'jquery-rails'


# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # https://github.com/rweng/pry-rails
  gem 'pry-rails'
  # https://github.com/Mon-Ouie/pry-remote
  # Use `rb: binding.remote_pry` `$ pry-remote`
  gem 'pry-remote'

  gem 'rspec-rails',      '~> 3.5'
  gem 'shoulda-matchers', '~> 3.1', '>= 3.1.1'
  gem 'capybara', '~> 2.10', '>= 2.10.1'
  gem 'factory_girl_rails', '~> 4.7'
  gem 'faker', '~> 1.6', '>= 1.6.6'
  gem 'simplecov',      '~> 0.12.0', require: false
  gem 'codeclimate-test-reporter', '~> 0.6.0', require: false
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
