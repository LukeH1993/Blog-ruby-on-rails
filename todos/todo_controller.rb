class TodoController < Sinatra::Base

	configure :development do
		register Sinatra::Reloader
	end

	set :root, File.join(File.dirname(__FILE__), '..')
	set :views Proc.new{File.join(root, 'views')}

	$todos = [{
		title: "What needs to be done"
		desc: "How to do it"
	}]

	# INDEX
	get '/todos/' do
		@page_header
		@todos = $todos
		erb :'todos/index'
	end

	# NEW
	
	# SHOW
	# CREATE
	# EDIT
	# UPDATE
	# DESTROY

end