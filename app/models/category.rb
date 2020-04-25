class Category < ApplicationRecord
  belongs_to :user
  has_many :products

  validates :title, uniqueness: true
end
