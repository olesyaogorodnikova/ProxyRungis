class Order < ApplicationRecord
  belongs_to :restaurant, optional: true
  belongs_to :cart
  geocoded_by :address_start, latitude: :ltd_starts, longitude: :lng_starts
  validates :day, presence: true, on: :update_order
  validates :time_start, presence: true, on: :update_order
  validates :time_end, presence: true, on: :update_order
  validates :address_start, presence: true, on: :update_order
  after_validation :geocode, if: :will_save_change_to_address_start?
  after_validation :geocode_address_end, if: :will_save_change_to_address_end?
  # after_save :direction_json, if: :will_save_change_to_address_end? || :will_save_change_to_address_start?
  monetize :amount_cents

  def direction_json
    self.direction = JSON.parse(HTTP.get("https://api.mapbox.com/directions/v5/mapbox/walking/#{self.lng_starts},#{self.ltd_starts};#{self.lng_ends},#{self.ltd_ends}?steps=true&access_token=#{ENV['MAPBOX_API_KEY']}").body)
    self.save
  end
  private

  def geocode_address_end
    coordinates = Geocoder.search(address_end).first.coordinates
    self.ltd_ends = coordinates[0]
    self.lng_ends = coordinates[1]
  end

end
