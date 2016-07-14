class LikesController < ApplicationController
	before_action :req_login

	def create
		if not Like.where(post_id: params[:id], user_id: session[:user_id]).exists?
			Like.create(post_id: params[:id],user_id: session[:user_id])
			redirect_to '/bright_ideas'
		else
			redirect_to :back
		end
	end
end
