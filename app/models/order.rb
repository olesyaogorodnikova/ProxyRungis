class Order < ApplicationRecord
  belongs_to :restaurant
  belongs_to :cart

  monetize :amount_cents
end
