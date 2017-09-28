class BlogController < Sinatra::Base

	configure :development do
		register Sinatra::Reloader
	end

	set :root, File.join(File.dirname(__FILE__), '..')
	set :views, Proc.new{File.join(root, 'views')}

	$blogs = [{
		title: "Blog Post 1",
		desc: "blah blah blah"
	},
	{
		title: "Blog Post 2",
		desc: "blah blah blah"
	}]

	# INDEX
	get '/blogs/' do
		@page_header = "Hello"
		@blogs = $blogs
		erb :'blogs/index'
	end

	# NEW
	get '/blogs/new' do
		erb :'blogs/new'
	end

	# SHOW
	
	# CREATE
	# EDIT
	# UPDATE
	# DESTROY

end