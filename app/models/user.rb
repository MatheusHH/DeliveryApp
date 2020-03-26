class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [ :owner, :admin, :customer ]

  #before_validation :set_role_user, on: :create

  private

  def set_role_user
    self.role = "customer"
  end
end
