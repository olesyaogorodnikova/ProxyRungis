class AddBioToPackages < ActiveRecord::Migration[5.2]
  def change
    add_column :packages, :bio, :boolean
  end
end
