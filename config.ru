require 'bundler'
Bundler.require

require './app'

map '/assets' do
  environment = Sprockets::Environment.new
  environment.append_path 'assets/javascripts'
  environment.append_path 'assets/stylesheets'
  environment.append_path 'assets/fonts'
  run environment
end

map '/' do
end

run Sinatra::Application