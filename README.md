# README

###
Created Rails application

Created main branch, pushed initial commit

$ rails generate resource Cat name:string age:integer enjoys:text image:text
$ cd cat-tinder-backend
$ db:migrate
$ rspec spec
  verified it's installed
$ rails db:seed
  verified seeds file
  verified could add cat from rails c

### CORS
added skip_before_action :verify_authenticity_token to ApplicationController

added gem 'rack-cors', :require => 'rack/cors' to Gemfile

Add a file to the config/initializers directory named cors.rb
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'  # <- change this to allow requests from any domain while in development.

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end

Run the command $ bundle from the command line to update the dependencies.
