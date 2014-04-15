source 'https://rubygems.org'

gem 'rails', '4.0.0.rc2'
gem 'sqlite3'
gem 'sass-rails', '~> 4.0.0.rc2'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'

gem 'carrierwave'
gem "resque"
gem "money"

# gem 'bcrypt-ruby', '~> 3.0.0'
# Not terribly stoked to monkeypatch my local version of webrick to clean up content length warnings, so I used thin
gem 'thin'

group :development, :test do
  gem 'rspec-rails', '~> 2.6'
  gem 'simplecov', :require => false
  gem 'foreman'
  gem 'debugger'
  gem 'flog'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use Capistrano for deployment
# gem 'capistrano', group: :development
