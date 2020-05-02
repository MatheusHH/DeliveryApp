class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :order_items
  has_many :orders, through: :order_items
  has_one_attached :image

  monetize :price_cents

  validates :title, :description, :category_id, presence: true 
end
