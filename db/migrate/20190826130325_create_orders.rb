class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :restaurant, foreign_key: true
      t.references :cart, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
