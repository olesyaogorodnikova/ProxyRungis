class Order < ApplicationRecord
  belongs_to :restaurant, optional: true
  belongs_to :cart
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  monetize :amount_cents
end
