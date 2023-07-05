class UsersController < ApplicationController
  def author
    @authors = User.all
    @authors_article_num = {}
    @authors.each do |author|
      num = Article.where(user_id: author.id).count
      @authors_article_num[author.id] = num
    end
  end

  def article_by_author
    @author_name = User.find(params[:id]).fullname
    @articles = Article.where(user_id: params[:id])
  end
end
