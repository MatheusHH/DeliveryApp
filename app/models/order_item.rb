class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  monetize :total_cents
  monetize :unit_price_cents

  before_save :set_unit_price
  before_save :set_total

  def unit_price
    if persisted?
      self[:unit_price_cents]
    else
      product.price_cents
    end
  end


  def total
    unit_price_cents*quantity
  end


  private

  def set_unit_price
    self[:unit_price_cents] = unit_price 
  end

  def set_total
    self[:total_cents] = total * quantity
  end
end
