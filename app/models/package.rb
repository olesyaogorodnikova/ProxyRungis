class Package < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  mount_uploader :photo, PhotoUploader
  monetize :price_cents

 # include PgSearch::Model
 #  pg_search_scope :search_by_category,
 #    against: [ :category ],
 #    using: {
 #        tsearch: { normalization: 0 }
 #      }

  include PgSearch::Model
    pg_search_scope :search_by_bio,
      against: [ :bio ],
      using: {
        tsearch: { prefix: true }
      }

end
