class BlogController < Sinatra::Base

	configure :development do
		register Sinatra::Reloader
	end

	set :root, File.join(File.dirname(__FILE__), '..')
	set :views Proc.new{File.join(root, 'views')}

	$blogs = [{
		title: "What needs to be done"
		desc: "How to do it"
	}]

	# INDEX
	get '/blogs/' do
		@page_header
		@blogs = $blogs
		erb :'blogs/index'
	end

	# NEW

	# SHOW
	# CREATE
	# EDIT
	# UPDATE
	# DESTROY

end