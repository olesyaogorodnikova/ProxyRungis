class Order < ApplicationRecord
  belongs_to :restaurant
  belongs_to :cart
  validates :orders, presence: true
end
