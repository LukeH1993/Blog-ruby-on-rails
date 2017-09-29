class BlogController < Sinatra::Base

	configure :development do
		register Sinatra::Reloader
	end

	set :root, File.join(File.dirname(__FILE__), "..")
	set :views, Proc.new{File.join(root, "views")}

	$blogs = [{
		title: "The Marketing Success of Android",
		desc: "By reason of the growth of mobile device sales in recent years, the mobile application market
			has grown to become a thriving part of the global economy. The process of developing and
			marketing Android OS applications has raised the important question as to whether the right
			product is being manufactured for the right purpose, in conformance to specification. This
			theory was investigated in Garvin’s (Garvin, 1996) Views of Quality, which models views of
			software quality into five categories. In this model, Garvin also makes a point that customers
			should get the software quality that they pay for."
	},
	{
		title: "Functional Testing",
		desc: "Functional tests were conducted to ensure all requirements for the application have been
			conformed. It was necessary for the application to perform at a satisfactory and suitable level,
			with all functionality requirements being achieved. The structure of the test involved inputs
			being evaluated against desired outputs. Tests were continuously were performed throughout
			the project after a sprint cycle process was completed. This saved time and enabled the
			project to move forward. Defects in the code, such as errors, bugs and warning, were raised
			and fixed to ensure clean code throughout the project."
	},
	{
		title: "What is XML?",
		desc: "It could be said that XML is a language used in the formatting process of application
			development. Harold and Means (Harold & Means, 2004) wrote a significant piece of work
			that defined XML as an extendible mark-up language, that defines a generic syntax used to
			mark-up data with simple, human-readable tags. Additionally, the authors make a point that
			XML is not a programming language like Java, and there is no such thing as an XML
			compiler, unlike Java, which has its own compiler that can read and execute Java code."
	}]

	# INDEX
	get "/blogs" do
		@page_header = "Blog A Blog"
		@blogs = $blogs
		erb :"blogs/index"
	end

	# NEW
	get "/blogs/new" do
		erb :"blogs/new"
	end

	# SHOW
	get "/blogs/:id" do
		@id = params[:id].to_i
		@blogs = $blogs[@id]
		erb :"blogs/show"
	end

	# CREATE
	post "/blogs" do
		new_blog = {
			title: params[:title],
			desc: params[:desc]
		}
		$blogs << new_blog
		redirect "/blogs"
	end

	# EDIT
	get "/blogs/:id/edit" do
		@id = params[:id].to_i
		@blogs = $blogs[@id]
		erb :"blogs/edit"
	end

	# UPDATE
	put "/blogs/:id" do
		id = params[:id].to_i
		$blogs[id][:title] = params[:title]
		$blogs[id][:desc] = params[:desc]
		redirect "/blogs/#{id}"
	end

	# DESTROY
	delete "/blogs/:id" do
		id = params[:id].to_i
		$blogs.delete_at(id)
		redirect '/blogs'
	end

end