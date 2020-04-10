class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        raise Pundit::NotAuthorizedError, 'Not allowed to view this action'
      end
    end
  end

  def new?
    user.admin?
  end

  def destroy?
  	record.user_id == user.id && user.admin?
  end

  def edit?
  	record.user_id == user.id && user.admin?
  end
end
