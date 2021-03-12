source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.0"

gem "rails", "~> 6.1.3"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "sass-rails", ">= 6"
gem "webpacker", "~> 5.0"
gem "bcrypt", "~> 3.1.7"
# gem "redis", "~> 4.0"
# gem "image_processing", "~> 1.2"

gem "bootsnap", ">= 1.4.4", require: false

group :development, :test do
  gem "capybara", "~> 3.34"
  gem "rspec-rails", "~> 4.0", ">= 4.0.2"
  gem "shoulda-matchers", "~> 4.4", ">= 4.4.1"
  gem "factory_bot_rails", "~> 6.1"
  gem "pundit-matchers", "~> 1.6"
  gem "rubocop", "~> 1.7"
  gem "rubocop-rspec", "~> 2.1"
  gem "rubocop-rails", "~> 2.9", ">= 2.9.1"
  gem "byebug", platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem "guard-rspec", require: false
  gem "web-console", ">= 4.1.0"
  gem "rack-mini-profiler", "~> 2.0"
  gem "better_errors", "~> 2.8", ">= 2.8.3"
  gem "binding_of_caller", "~> 1.0"
  gem "listen", "~> 3.3"
  gem "spring"
end

gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
