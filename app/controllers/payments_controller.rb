class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def show
    @order = Order.find(params[:id])
  end

  def create
    begin
      @order = MoipCreateOrderService.new(params).call
      MoipCreatePaymentService.new(@order, params).call
      redirect_to root_path, notice: t('flash.actions.create.payment')
    rescue ActiveRecord::RecordInvalid => invalid
      render "payments/error"
    end
  end
end
