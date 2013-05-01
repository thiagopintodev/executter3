source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0.beta1'

gem 'pg'
gem 'jquery-rails'
gem 'turbolinks'            # https://github.com/rails/turbolinks
gem 'jbuilder', '~> 1.0.1'  # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'simple_form', github: 'plataformatec/simple_form'
gem 'hash_extension'
gem 'validates_email_format_of'
gem 'bcrypt-ruby'

gem 'permissions' #,
  #github: 'yakko/permissions'
  #path: '../permissions'

gem 'load_resource_rails' #,
  #github: 'yakko/load_resource_rails'
  # path: '../load_resource_rails'



# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 4.0.0.beta1'
  gem 'coffee-rails', '~> 4.0.0.beta1'
  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem 'thin'
end

group :production do
  gem 'unicorn'
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