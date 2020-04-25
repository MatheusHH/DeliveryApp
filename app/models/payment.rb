class Payment < ApplicationRecord
  belongs_to :order
  belongs_to :user

  monetize :total_cents

  enum status: [ :processando, :recusado, :pago ]

  validates :moip_id, :user_id, presence: true
  
  validates :order_id, uniqueness: { scope: :order_id,
    message: "You have already paid this order!" }
end
