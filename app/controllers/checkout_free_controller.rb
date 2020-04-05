class CheckoutFreeController < ApplicationController
  before_action :authenticate_user!

  def show
    @order = Order.find(params[:id])
  end
end
