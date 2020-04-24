class WebhooksController < ApplicationController
  
  skip_before_action :verify_authenticity_token
 
  def webhooks
    moip_id = params['resource']['order']['id']
    payment = Payment.find_by(moip_id: moip_id)
 
    if params['event'] == 'ORDER.PAID'
      payment.update(status: :pago)
      payment.order.update(status: :pago)
    elsif params['event'] == 'ORDER.NOT_PAID'
      payment.update(status: :recusado)
    end
 
    render json: {status: :ok}
  end
end
