source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.1"

gem "pg"
gem "puma"
gem "rails"
gem "webpacker"

gem "bootsnap", ">= 1.4.2", require: false

group :development, :test do
  gem "byebug"
  gem "dotenv-rails"
  gem "faker"
end

group :development do
  gem "listen"
  gem "spring"
  gem "spring-watcher-listen"
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "factory_bot_rails"
  gem "fakeredis"
  gem "rspec-rails"
  gem "selenium-webdriver"
  gem "timecop"
  gem "vcr"
  gem "webmock"
end
