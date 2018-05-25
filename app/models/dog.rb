class Dog < ApplicationRecord
  has_many :dog_users
  has_many :users, through: :dog_users
  has_many :reviews
  has_many :rentals
end
