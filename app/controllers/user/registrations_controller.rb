class User::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  before_action :configure_permitted_parameters

  # GET /users/sign_up
  def new
    # Override Devise default behaviour and create a address as well
    build_resource({})
    resource.build_address
    respond_with self.resource
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(:email, :name, :password, :password_confirmation, address_attributes: [:id, :cep, :neighborhood, :street, :city, :state, :_destroy])
    end
  end
end
