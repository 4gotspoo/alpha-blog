class PagesController < ApplicationController

	def home

	end

	def about

	end

	def archive
		@articles = Article.all
	end

end