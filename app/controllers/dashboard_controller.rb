class DashboardController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @products = Product.all.page(params[:page]).per(4)
    @order_item = current_order.order_items.new
  end
end
