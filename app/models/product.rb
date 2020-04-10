class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :order_items

  monetize :price_cents
end
