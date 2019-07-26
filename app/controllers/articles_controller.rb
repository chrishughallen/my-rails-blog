class ArticlesController < ApplicationController

	before_action :set_article, only: [:edit, :update, :show, :destroy]

	def new
	  @article = Article.new
	end

	def index
		@articles = Article.all
	end

	 def create
	    @article = Article.new(article_params)

	    respond_to do |format|
	      if @article.save
	        format.html { redirect_to @article, notice: "Article created!" }
	      else
	        format.html { render action: 'new' }
	      end
	    end
	  end

	def show
	end

	def edit
	end

	def update
		@article.update(article_params)
		redirect_to article_path(@article)
	end

	def destroy
	  @article.destroy
	  redirect_to articles_path
	 end

	def set_article
		@article = Article.find(params[:id])
	end

	private
	  def article_params
	   params.require(:article).permit(:title, :description)
	  end

end