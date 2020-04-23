class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [ :customer, :owner, :admin ]

  has_many :products, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_one :address, dependent: :destroy
  has_many :payments

  accepts_nested_attributes_for :address, allow_destroy: true

end
