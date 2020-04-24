class Payment < ApplicationRecord
  belongs_to :order
  belongs_to :user

  monetize :total_cents

  enum status: [ :processando, :recusado, :pago ]
end
