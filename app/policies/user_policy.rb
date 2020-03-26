class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
    	if user.admin?
        scope.where(role: :customer)
      elsif user.owner?
        scope.all
      else
      	raise Pundit::NotAuthorizedError, 'Not allowed to view this action'
      end
    end
  end

  def index?
  	user.admin?
  end

  def redirect_form?
    user.owner?
  end

  def new?
  	user.owner?
  end

  def destroy?
    user.admin?
  end

  def role_field?
    user.owner?
  end

  def edit?
  	record.id == user.id
  end

  def permitted_attributes
  	if user.owner?
  		[:name, :email, :password, :password_confirmation, :role]
  	else
  		[:name, :email, :password, :password_confirmation]
  	end
  end
end
