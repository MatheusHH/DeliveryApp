class DeliveryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        raise Pundit::NotAuthorizedError, 'Not allowed to view this action'
      end
    end
  end

  def index?
    user.admin?
  end

  def show?
    record.user.id == user.id || user.admin?
  end

  def destroy?
    user.admin?
  end

  def edit?
    user.admin?
  end
end
