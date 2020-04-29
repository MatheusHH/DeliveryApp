class DeliveriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_delivery, only: [:show, :edit, :update, :destroy]

  def index
    @deliveries = policy_scope(Delivery).order(status: :asc).page(params[:page]).per(4)
  end

  def show
    authorize @delivery
  end

  def edit
    authorize @delivery
  end

  def create
    @delivery = Delivery.create(delivery_params)
    respond_to do |format|
      if @delivery.save
        format.html { redirect_to @delivery, notice: t('flash.actions.create.notice', model: @delivery.model_name.human) }
        format.json { render :show, status: :created, location: @delivery }
        session[:order_id] = nil
      else
        format.html { render :error }
        format.json { render json: @delivery.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @delivery.update(delivery_params)
        format.html { redirect_to @delivery, notice: t('flash.actions.update.notice', model: @delivery.model_name.human) }
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
      format.html { redirect_to deliveries_url, notice: t('flash.actions.destroy.notice') }
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
