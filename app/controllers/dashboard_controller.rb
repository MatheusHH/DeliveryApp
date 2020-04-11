class DashboardController < ApplicationController
  before_action :authenticate_user!

  before_action :set_categories
  before_action :load_order_item
  
  def index
    if params[:category_id].present?
      @products = Product.where(category_id: params[:category_id]).page(params[:page]).per(4)
      respond_to do |format|
        format.html {}
        format.js { render partial: 'search-results'}
      end
    else  
      @products = Product.all.page(params[:page]).per(4)
    end
    
  end

  private

  def set_categories
    @categories = Category.all
  end

  def load_order_item
    @order_item = current_order.order_items.new
  end
end
