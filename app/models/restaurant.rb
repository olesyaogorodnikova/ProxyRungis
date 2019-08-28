class Restaurant < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :delivery_start_hour, presence: true
  validates :delivery_end_hour, presence: true
  has_many :orders
end
