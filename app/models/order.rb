class Order < ApplicationRecord
  belongs_to :restaurant, optional: true
  belongs_to :cart

  monetize :amount_cents
end
