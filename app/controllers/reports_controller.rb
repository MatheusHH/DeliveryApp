class ReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin_only

 
  def index
    @total_sales_by_card = Order.where(status: :pago)
    @total_sales_by_money = Order.where(status: :loja)
    @order_by_customer = Order.where(status: [:loja, :pago]).includes(:user).references(:users).where("users.role = ?", 0)
    @best_sellers = Order.where(status: [:loja, :pago]).includes(:order_items, :products).references(:order_items, :products)
  end 

  private

  def authorize_admin_only
    unless current_user.admin?
      redirect_to root_path, alert: t('flash.unauthorized')
    end
  end
end
