class PostsController < ApplicationController
	def index
	end

	def new
		@post = Post.new
		render :new
	end

end