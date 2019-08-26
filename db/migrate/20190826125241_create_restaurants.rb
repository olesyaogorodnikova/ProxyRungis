class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.integer :delivery_start_hour
      t.integer :delivery_end_hour
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
