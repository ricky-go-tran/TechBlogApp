class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: %i[edit update new destory manage create]
  before_action :get_article, only: %i[edit update show destroy]

  def index
    @pagy, @articles = pagy(Article.all, items: 4)
  end

  def show
    # show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    current_user.add_role :own, @article
    if @article.save
      redirect_to manage_articles_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # edit
  end

  def update
    authorize @article
    if @article.update(article_params)
      redirect_to manage_articles_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @article
    @article.destroy
    redirect_to manage_articles_path, status: :see_other
  end

  def manage
    @author_name = User.find(current_user.id).fullname
    @articles = Article.where(user_id: current_user.id)
  end

  def not_permission
    # Not Enough Permission Access Article
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :publish)
  end

  def get_article
    @article = Article.find(params[:id])
  end
end
