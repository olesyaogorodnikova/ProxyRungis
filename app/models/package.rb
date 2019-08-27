class Package < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  mount_uploader :photo, PhotoUploader
  monetize :price_cents
end
