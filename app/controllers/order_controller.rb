class OrderController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = policy_scope(Order).all.page(params[:page]).per(4)
  end

  def show
    @order = Order.find(params[:id])
  end
end
