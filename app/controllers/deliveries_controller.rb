class DeliveriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_delivery, only: [:show, :edit, :update, :destroy]

  def index
    @deliveries = policy_scope(Delivery).all
  end

  def show
    authorize @delivery
  end

  def edit
    authorize @delivery
  end

  def create
    @delivery = Delivery.create!(delivery_params)
    @delivery.save
    session[:order_id] = nil
    redirect_to delivery_path(@delivery)
  end

  def update
    respond_to do |format|
      if @delivery.update(delivery_params)
        format.html { redirect_to @delivery, notice: 'Delivery was successfully created.' }
        format.json { render :show, status: :created, location: @delivery }
      else
        format.html { render :edit } 
        format.json { render json: @delivery.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @delivery
    @delivery.destroy
    respond_to do |format|
      format.html { redirect_to deliveries_url, notice: 'Delivery was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_delivery
    @delivery = Delivery.find(params[:id])
  end
  

  def delivery_params
    return {} unless params.has_key?(:delivery)
    params.require(:delivery).permit(:order_id, :user_id, :status)
  end
end
