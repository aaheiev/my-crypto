source "https://rubygems.org"

gem "jets", "~> 3.1.0"
gem "pg", "~> 1.2.3"
gem "dynomite"
gem "zeitwerk", ">= 2.5.0"
gem 'lockbox'
gem 'tzinfo-data'
gem 'composite_primary_keys'
gem 'binance-connector-ruby'

# gem "faraday"
# gem 'csv'
# gem 'colorize'

# development and test groups are not bundled as part of the deployment
group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'shotgun'
  gem 'rack'
  gem 'puma'
end

group :test do
  gem 'rspec' # rspec test group only or we get the "irb: warn: can't alias context from irb_context warning" when starting jets console
  gem 'launchy'
  gem 'capybara'
end
