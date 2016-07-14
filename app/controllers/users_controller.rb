class UsersController < ApplicationController
	before_action :req_login, only: [:show, :log_out]
  def new
  end

  def show
  	@user = User.find( params[:id] )
  end

  def create
  	@new_user = User.new( safe_params )
  	if @new_user.save
  		session[:user_id] = @new_user.id
  		redirect_to '/bright_ideas'
  	else
  		flash[:errors] = @new_user.errors.full_messages
  		redirect_to :back
  	end
  end

  def login
  	user = User.find_by_email(params[:email])

  	if user && user.authenticate(params[:password])
  		session[:user_id]=user.id 
  		redirect_to '/bright_ideas/'
  	else
  		flash[:errors]=['yo.stuffs gotta be the right stuff...']
  		redirect_to :back
  	end
  end

  def logout
  	session[:user_id]=nil
  	redirect_to '/'
  end

  private
  def safe_params
  	params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
  end
end
