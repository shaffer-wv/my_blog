class ArticlesController < ApplicationController

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(params[:article])
		if @article.save
			redirect_to article_path(@article)
		else
			redirect_to action: new
		end
	end

	def destroy
		@article = Article.find(params[:id]).destroy
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		if @article.update_attributes(params[:article])
			redirect_to article_path(@article)
		else
			redirect_to action: edit
		end
	end

end
