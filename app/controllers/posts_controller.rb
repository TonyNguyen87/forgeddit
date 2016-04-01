class PostsController < ApplicationController
	def index
		@post = Post.all
		render :index
	end

	def new
		@post = Post.new
		render :new
	end
end