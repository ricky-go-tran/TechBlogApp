class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: %i[edit update new destory manage create]

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
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      redirect_to manage_articles_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to manage_articles_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to manage_articles_path, status: :see_other
  end

  def manage
    @author_name = User.find(current_user.id).fullname
    @articles = Article.where(user_id: current_user.id)
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :publish)
  end
end
