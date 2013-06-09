source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0.rc1'
gem 'pg'
gem 'haml'


gem 'simple_form'#, github: 'plataformatec/simple_form'
gem 'hash_extension'
gem 'validates_email_format_of'

gem 'permissions' #,
  #github: 'yakko/permissions'
  #path: '../permissions'

gem 'load_resource' #,
  #github: 'yakko/load_resource'
  #path: '../load_resource'



gem 'jquery-rails'
gem 'turbolinks'            # https://github.com/rails/turbolinks
gem 'jbuilder', '~> 1.0.1'  # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder

gem 'sass-rails', '~> 4.0.0.rc1'  # Use SCSS for stylesheets
gem 'uglifier', '>= 1.3.0'        # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails', '~> 4.0.0'    # Use CoffeeScript for .js.coffee assets and views

gem 'bootstrap-sass'
gem 'font-awesome-sass-rails'

group :development do
  gem 'thin'
  gem 'rails-footnotes', github: 'tommireinikainen/rails-footnotes'
end

group :production do
  gem 'unicorn'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development, :test do
  gem 'cucumber-rails', :require => false
  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
  # webrat
  gem 'webrat'
  # Then show me the page
  gem 'launchy'
end
