class ReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin_only


  def index
    @total_sales = Order.all 
  end 

  private

  def authorize_admin_only
    unless current_user.admin?
      redirect_to root_path, alert: t('flash.unauthorized')
    end
  end
end
