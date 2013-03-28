New-Item C:\OurRubyProject\Gemfile -type file -value "source 'https://rubygems.org'
# add gems after line
gem 'rails', '3.2.8'

gem 'sqlite3'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

gem 'paperclip'

gem 'sorcery'"
