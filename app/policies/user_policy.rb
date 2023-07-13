class UserPolicy < ApplicationPolicy

  def manage?
    user.has_role? :admin
  end
end
