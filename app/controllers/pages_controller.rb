class PagesController < ApplicationController

	def home
		@articles = Article.paginate(page: params[:page], per_page: 5)
	end

	def about

	end

	def archive
		@articles = Article.all
	end

end