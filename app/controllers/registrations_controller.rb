class RegistrationsController < ApplicationController
	def new
		@user = User.new
		render :new
	end

	def create
		@user = User.new(username: params["username"],
						email: params["email"],
						password: params["password"])
		if @user.save
			session[:user_id] = @user_id
			flash[:notice] = "#{@user.username}"
			redirect_to :root
		else
			flash[:notice] = "There was an error please try again"
			render :new
		end
	end
end