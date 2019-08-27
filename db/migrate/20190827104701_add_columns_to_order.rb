class AddColumnsToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :state, :string
    add_column :orders, :package_sku, :string
    add_monetize :orders, :amount, currency: { present: false }
    add_column :orders, :payment, :jsonb
    add_reference :orders, :user, index: true

  end
end
