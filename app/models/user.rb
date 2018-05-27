class User < ApplicationRecord
  has_many :dog_users
  has_many :dogs, through: :dog_users
  has_many :reviews
  has_many :rentals
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
