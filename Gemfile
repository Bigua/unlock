source 'http://rubygems.org'

ruby '2.1.3'

gem 'rails', '4.1.6'

# Database and model related
gem 'inherited_resources'
gem 'pg'
gem 'state_machine'
gem 'validates_cpf_cnpj'
gem 'paperclip', '~> 4.1.1'
gem 'paperclip-meta'
gem 'schema_plus'

# Authentication and authorization
gem 'devise'
gem 'pundit'

# I18n
gem 'devise-i18n'
gem 'devise-i18n-views'
gem 'rails-i18n', github: 'svenfuchs/rails-i18n', branch: 'master'

# Views and assets
gem 'neat'
gem 'slim'
gem 'slim-rails'
gem 'normalize-rails'
gem 'sass-rails'
gem 'coffee-rails'
gem 'uglifier'
gem 'jquery-rails'
gem 'underscore-rails'
gem 'fb-channel-file'
gem 'active_decorator'
gem 'jbuilder'
gem 'rest_in_place'
gem 'autosize-rails'
gem 'icomoon-rails'
gem 'pickadate-rails'
gem 'brhelper'
gem 'high_voltage'
gem 'maskmoney-rails'

# Other
gem 'auto_html', '= 1.5.1'
gem 'RedCloth'
gem 'aws-sdk'
gem 'rack-timeout'

# gem 'unlock_moip', path: '../unlock_moip'
gem 'unlock_moip', '0.0.3', github: 'danielweinmann/unlock_moip', branch: 'master'

group :test, :development do
  gem 'rspec-rails'
  gem "shoulda-matchers"
  gem 'letter_opener'
  gem 'spring'
end

group :production do
  # Workers, forks and all that jazz
  gem 'unicorn'
  # Enabling Gzip on Heroku
  # If you don't use Heroku, please comment the line below.
  gem 'heroku-deflater', '>= 0.4.1'
  # Monitoring with the new new relic
  gem 'newrelic_rpm'
  gem 'rails_12factor'
end
