source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.0'
gem 'rails', '~> 5.2.2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'pundit'
gem 'bcrypt', '~> 3.1.7'
gem 'jwt'
gem 'simple_command'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'active_model_serializers'
gem 'valid_email2'

group :development, :test do
  gem 'pry-byebug'
  gem 'rspec-rails', '~> 3.8'
  gem 'shoulda-matchers', '4.0.0.rc1'
  gem 'rails-controller-testing'
  gem 'factory_bot_rails', '~> 4.0'
  gem 'database_cleaner'
  gem 'cucumber-rails', require: false
  gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'
  gem 'json_spec'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
