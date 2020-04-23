class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = MoipCreateOrderService.new(params).call
    MoipCreatePaymentService.new(@order, params).call
    redirect_to root_path, notice: 'Order has been paid !.' 
  end
end
