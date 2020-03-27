class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    class Scope < Scope
      def resolve
        scope.all
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
