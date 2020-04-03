module ApplicationHelper
  
  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      last_order = current_user.orders.where(status: :pendente).last 
      if last_order.present?
        session[:order_id] = last_order.id
        Order.find(session[:order_id])
      else
        Order.new
      end
    end
  end

  #def current_order
  # if !session[:order_id].nil?
  #    Order.find(session[:order_id])
  #  else
  #    Order.new
  #  end
  #end

  def formatted_value(value)
    value = value * 1.00
    value = value / 100
    value = number_to_currency(value, precision: 2, unit: "", separator: ",", delimiter: ".", format: "%n %u")
  end
end
