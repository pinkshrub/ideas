class LikesController < ApplicationController
	before_action :req_login

	def create
		Like.create(post_id: params[:id],user_id: session[:user_id])
		redirect_to '/bright_ideas'
	end
end
