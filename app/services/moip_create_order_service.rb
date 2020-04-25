class MoipCreateOrderService
  def initialize params
    @api = MoipService.new.call
    @moip_code = generate_moip_code
    @user_moip_code = generate_moip_code
    @params = params
  end
 
  def call
    @order = @api.order.create(order_json)
    Payment.create!(moip_id: @order["id"], status: :processando, order_id: @params[:payment][:order_id], user_id: @params[:payment][:user_id], total_cents: @params[:payment][:subtotal].to_i)
  end
 
  private
 
  def order_json
    {
      ownId: @moip_code,
      amount: {
        currency: 'BRL',
      },
      items: [
        {
          product: 'Delivery App Compras',
          category: 'OTHER_CATEGORIES',
          quantity: 1,
          detail: 'Compras no Aplicativo',
          price: @params[:payment][:subtotal].to_i
        } 
      ],
      customer: {
        ownId: @user_moip_code,
        fullname: @params[:payment][:fullname],
        email: @params[:payment][:email],
        taxDocument: {
          type: 'CPF',
          number: @params[:payment][:cpf]
        },
        phone: {
          countryCode: '55',
          areaCode: @params[:payment][:area_code],
          number: @params[:payment][:phone]
        },
        shippingAddress: {
          street: @params[:payment][:street],
          streetNumber: @params[:payment][:number],
          city: @params[:payment][:city],
          district: @params[:payment][:district],
          state: @params[:payment][:state],
          country: @params[:payment][:country],
          zipCode: @params[:payment][:zipcode]
        }
      }
    }
  end
 
  def generate_moip_code
    (0...20).map { ('a'..'z').to_a[rand(26)] }.join
  end
end