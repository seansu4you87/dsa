require 'rubygems'
require 'mongo'

source 'http://gemcutter.org'

gem 'rails', '3.1.0'
gem 'mongoid', '~> 3.0.0.rc'
#gem 'mongoid-paperclip', :require => 'mongoid_paperclip'

### Mongo Mapper gems
#gem 'mongo_mapper'
#gem 'mm-attach-it'


# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git

group :development do
  gem 'sqlite3', '1.3.5'
end

group :production do
  gem 'pg', '0.12.2'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

group :test, :spec, :cucumber do
  gem 'rspec'
  gem 'rspec-rails'
  gem 'rails3-generators'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'cucumber'
  gem 'cucumber-rails'
  gem 'database_cleaner'
  gem 'spork'
  gem 'launchy'
end

