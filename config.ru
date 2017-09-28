require 'sinatra'
require 'sinatra/reloader'
require 'rack'
require_relative 'controllers/blog_controller.rb'

use Rack::MethodOverride

run BlogController