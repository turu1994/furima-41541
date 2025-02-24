source "https://rubygems.org"
ruby "3.2.0"
gem "rails", "~> 7.1.0"
gem "sprockets-rails"
gem "mysql2", "~> 0.5"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false
group :development do
  gem "web-console"
end
group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
end
group :development do
  gem 'rubocop', require: false
end
group :production do
  gem 'pg'
end
gem 'devise'
group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'rspec-rails', '~> 4.0.0'
end
gem 'factory_bot_rails'
gem 'faker'
gem 'mini_magick'
gem 'image_processing', '~> 1.2'
gem 'active_hash'
gem 'payjp'
gem 'gon'