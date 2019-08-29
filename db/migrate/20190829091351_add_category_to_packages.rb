class AddCategoryToPackages < ActiveRecord::Migration[5.2]
  def change
    add_column :packages, :category, :string
  end
end
