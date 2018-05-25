class User < ApplicationRecord
  has_many :dog_users
  has_many :dogs, through: :dog_users
  has_many :reviews
  has_many :rentals
end
