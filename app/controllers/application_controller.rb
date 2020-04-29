class ApplicationController < ActionController::Base
  include ApplicationHelper
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  layout :layout_by_resource

  private

  def layout_by_resource
    if devise_controller?
      "devise_layout"
    else
      "application"
    end
  end

  def after_sign_in_path_for(resource)
    dashboard_index_path
  end

  def after_sign_out_path_for(resource_or_scope)
    user_session_path
  end

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore
 
    flash[:error] = t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default
    redirect_to(request.referrer || root_path)
  end
end
