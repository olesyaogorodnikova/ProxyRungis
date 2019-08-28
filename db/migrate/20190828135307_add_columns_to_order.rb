class AddColumnsToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :day, :date
    add_column :orders, :time_start, :time
    add_column :orders, :time_end, :time
    add_column :orders, :address, :string
    add_column :orders, :latitude, :float
    add_column :orders, :longitude, :float
  end
end
