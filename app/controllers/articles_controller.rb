class ArticlesController < ApplicationController
  skip_before_action :authenticate, only: :index
  before_action :authorized_user, only: [:index, :new]

  def index
    @articles = Article.all
  end

  def new
    @article = @current_user.articles.new
  end

  def create
    @article = Article.new article_params

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def show
    @article = Article.find params[:id]
  end

  def edit
    @article = Article.find params[:id]
  end

  def update
    @article = Article.find params[:id]

    if @article.update article_params
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find params[:id]

    @article.destroy

    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:user_id, :title, :text)
  end
end
