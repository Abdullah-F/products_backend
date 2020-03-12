source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.3"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 6.0.2", ">= 6.0.2.1"
gem "jwt", "~> 1.5", ">= 1.5.4"
gem "simple_command", "~> 0.1.0"
gem "bcrypt", "~> 3.1", ">= 3.1.12"
gem "draper", "~> 4.0"
gem "rack-cors", "~>1.1.1"
gem 'kaminari', '~> 0.16.3'
# Use mysql as the database for Active Record
gem "mysql2", ">= 0.4.4"
#gem 'sqlite3', '~> 1.4'
# Use Puma as the app server
gem "puma", "~> 4.1"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.2", require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "rspec-rails", "~> 3.9.0"
  gem "factory_bot_rails", "~> 5.1.1"
  gem "faker", "~> 2.10.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  #gem "spring-watcher-listen", "~> 2.0.0"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
