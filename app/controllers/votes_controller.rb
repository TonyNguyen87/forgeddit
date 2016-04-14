class VotesController < ApplicationController
	before_action :authenticate!

	def create
		@vote = current_user.votes.create(post_id: params[:id],
									   score: params[:score])
		redirect_to root_path 
	end

end