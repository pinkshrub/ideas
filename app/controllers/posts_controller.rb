class PostsController < ApplicationController
	before_action :req_login
  def index
  	@user = User.find(session[:user_id])
  	@posts = Post.all.sort_by(&:total_likes).reverse
  end

  def show
  	@post = Post.find(params[:id])
  end

  def create
  	@new_post = Post.new( post_params )
  	@new_post.user_id = session[:user_id]
  	if @new_post.save
  		redirect_to :back
  	else 
  		flash[:errors]=@new_post.errors.full_messages
  		redirect_to :back
  	end
  end


  private
  def post_params
  	params.require(:post).permit(:content)
  end
end
