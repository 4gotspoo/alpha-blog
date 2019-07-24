class UsersController < ApplicationController

	def index
		@users = User.paginate(page: params[:page], per_page: 1)
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			flash[:notice] = "User account created! Welcome aboard, #{@user.username}!"
			redirect_to articles_path
		else
			render 'new'
		end
	end

	def edit
		set_user
	end

	def update
		set_user
		if @user.update(user_params)
			flash[:notice] = "User account was successfully updated!"
			redirect_to articles_path
		else
			render :edit
		end
	end

	def show
		@users = User.all
		@user = User.find(params[:id])
		@user_articles = @user.articles.paginate(page: params[:page], per_page: 3)
	end

	private
	def set_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:username, :email, :password)
	end

end