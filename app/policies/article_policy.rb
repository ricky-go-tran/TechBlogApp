class ArticlePolicy < ApplicationPolicy
  def update?
    user.has_role?(:own, record)
  end
  def destroy?
    user.has_role?(:own, record)
  end

end
