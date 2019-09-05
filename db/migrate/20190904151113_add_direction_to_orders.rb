class AddDirectionToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :direction, :json
  end
end
