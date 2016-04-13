class VotesController < ApplicationController
	before_action :authenticate!

	def comment
		@vote = current_user.votes.new(post_id: params[:post_id],
										score: params[:score])
		flash[:notice] = "errors making vote" if @vote.save
		redirect_to show_path
		end
	end

	def post
		@vote = current_user.votes.new(comment_id: params[:comment_id],
										score: params [:score])
		flash[:notice] = "errors making vote" if @vote.save
		redirect_to show_path
		end
	end
def