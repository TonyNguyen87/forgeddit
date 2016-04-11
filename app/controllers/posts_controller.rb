class PostsController < ApplicationController
	before_action :authenticate!, except: [:index, :new, :show]
	def index
		@posts = Post.all
		render :index
	end

	def new
		@post = Post.new
		render :new
	end

	def show
		@post = Post.find(params["id"])
		render :show
	end

	def create
		@post = current_user.posts.new(title: params["title"],
									link_url: params["link_url"])
		@post.save
		# binding.pry
		redirect_to :root
	end

	def destroy
    	post = Post.find(params["id"])
    	if current_user.id == post.user_id
      		post.destroy
    	else
      		flash[:notice] = "You don't have permission to do that, asshole."
    	end
    		redirect_to :root
  	end

  	def show
    	@post = Post.find(params["id"])
    	render :show
  	end

  	def edit
    	post = Post.find(params["id"])
    	render :edit, locals: { post: post }
  	end

  	def update
  		post = Post.find(params["id"])
  		post.update(title: params["title"],
  					link_url: params["link_url"])
  		redirect_to root_path
  	end
end