class Delivery < ApplicationRecord
  belongs_to :order
  belongs_to :user

  enum status: [ :pendente, :enviando, :entregue ]

  before_create :close_order
  before_validation :set_status, on: :create
  before_destroy :set_order_payment

  validates :user_id, presence: true

  validates :order_id, uniqueness: { scope: :order_id,
    message: "You have already created this delivery!" }

  private

   def close_order
      order = Order.find(self.order_id)
      order.loja! 
   end  

   def set_status
      self[:status] = :pendente
   end

   def set_order_payment
    order = Order.find(self.order_id)
    order.pendente!
   end
end
