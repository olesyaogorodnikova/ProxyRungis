class AddNumberPersonsToPackages < ActiveRecord::Migration[5.2]
  def change
    add_column :packages, :number_people, :integer
  end
end
