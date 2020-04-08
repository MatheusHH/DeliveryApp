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
  	user.admin? || user.owner?
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
  	record.id == user.id || user.owner?
  end

  def permitted_attributes
  	if user.owner?
  		[:name, :email, :password, :password_confirmation, :role]
  	else
  		[:name, :email, :password, :password_confirmation, address_attributes: [:id, :cep, :neighborhood, :street, :city, :state, :_destroy]]
  	end
  end
end
