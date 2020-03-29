class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items

  monetize :subtotal_cents
  monetize :total_cents

  before_save :set_subtotal

  def subtotal
    order_items.collect{|order_item| order_item.valid? ? order_item.unit_price_cents*order_item.quantity : 0}.sum
  end

  private

  def set_subtotal
    self[:subtotal_cents] = subtotal
  end
end
