class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [ :owner, :admin, :customer ]

  has_many :products
  has_many :orders

  before_validation :set_role_user, on: :create

  private

  def set_role_user
    self.role = "customer" unless self.role.present?
  end
end
