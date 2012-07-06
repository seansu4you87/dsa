require 'rubygems'
require 'mongo'

source 'http://gemcutter.org'

gem 'rails', '3.1.0'
gem 'mongoid', '~> 3.0.0.rc'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git

group :development do
  gem 'sqlite3', '1.3.5'
  gem 'factory_girl_rails'
  gem "rails3-generators", :git => "https://github.com/neocoin/rails3-generators.git"
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
  gem "rails3-generators", :git => "https://github.com/neocoin/rails3-generators.git"
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'spork'
  gem 'launchy'
end

group :test do
  gem 'cucumber'
  gem 'cucumber-rails'
end

