require 'sinatra'
require 'sinatra/reloader'
require 'rack'
require_relative '.todos/todo_controller.rb'

use Rack::MethodOverride

run BlogController