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
      flash[:message] = "You are hosed!"
      render :new
    end
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    article = Article.find(params[:id])
    article.update_attributes(params[:article])
    
    redirect_to article_path(article)
  end
  
  def destroy
    article = Article.find(params[:id])
    article.destroy
    flash[:message] = "Article #{article.title} was destroyed."
    redirect_to articles_path
  end
end
