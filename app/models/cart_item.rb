class CartItem < ApplicationRecord
  belongs_to :package
  belongs_to :cart
  # validates :quantity, presence: true
end
