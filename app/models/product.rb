class Product < ApplicationRecord
  belongs_to :user
  has_many :order_items

  monetize :price_cents
end
