module ApplicationHelper
  
  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  def formatted_value(value)
    value = number_to_currency((value/100), precision: 2, unit: "", separator: ",", delimiter: ".", format: "%n %u")
  end
end
