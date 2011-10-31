source 'http://rubygems.org'

gem 'rails', '3.0.9'
gem 'pg', '~>0.10.1'
gem 'clearance', '~>0.12'
gem "paperclip", "~> 2.3"
gem "exception_notification", "~>1.0.0", :git => "git://github.com/rails/exception_notification", :require => 'exception_notifier'
gem "possessive" 

group :development, :test do
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'cucumber-rails'
  gem 'cucumber'
  gem 'spork'
end

gem "barby", "~>0.4" #barcode generator
gem "rqrcode", "~>0.3" #required by barby
gem "rmagick" #must be at end or else it pisses off Nokigiri with it's old version of libxml
