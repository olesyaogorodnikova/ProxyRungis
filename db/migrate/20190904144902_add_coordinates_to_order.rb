class AddCoordinatesToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :ltd_starts, :float
    add_column :orders, :lng_starts, :float
    add_column :orders, :ltd_ends, :float
    add_column :orders, :lng_ends, :float
    add_column :orders, :address_start, :string
    add_column :orders, :address_end, :string
  end
end
