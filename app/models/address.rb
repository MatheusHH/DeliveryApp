class Address < ApplicationRecord
  belongs_to :user

  validates :cep, :street, :neighborhood, :city, :state, presence: true 
end
